class ImportAkall
	include Sidekiq::Worker

  require 'smarter_csv'
	require 'open-uri'
	require 'ruby-progressbar'

  # Dont retry Failed Jobs
  sidekiq_options retry: false

  # Import Alliance Kills All
  def perform(world)
  	
  	progress = ProgressBar.create( :format         => '%a %bᗧ%i %p%% %t',
	                                 :progress_mark  => ' ',
	                                 :remainder_mark => '･',
	                                 :total          => nil,
	                                 :title          => 'Importing Alliance All Bash')

	  url = "http://#{world.to_s}.grepolis.com/data/alliance_kills_all.txt"
	  url_data = open(url).read()
	  File.open('/tmp/aly_kills_all.txt', 'w') { |file| file.write(url_data) }
	  progress.total = open(url).readlines.size

	  SmarterCSV.process('/tmp/aly_kills_all.txt', {
	    :user_provided_headers => [
	      "all_rank", "grepo_id", "all_points"
	    ], headers_in_file: false
	  }) do |array|

	    array.each do |a|
	      Alliance.where(:grepo_id => a[:grepo_id]).update_all(:all_rank => a[:all_rank], :all_points => a[:all_points])
	      progress.increment
	    end

	  end
  end
end