class ImportAkatt
	include Sidekiq::Worker

  require 'smarter_csv'
	require 'open-uri'
	require 'ruby-progressbar'

  # Dont retry Failed Jobs
  sidekiq_options retry: false

  # Import Alliance Kills Att
	def perform(world)

		progress = ProgressBar.create( :format         => '%a %bᗧ%i %p%% %t',
	                                 :progress_mark  => ' ',
	                                 :remainder_mark => '･',
	                                 :total          => nil,
	                                 :title          => 'Importing Alliance Att Bash')

	  url = "http://#{world.to_s}.grepolis.com/data/alliance_kills_att.txt"
	  url_data = open(url).read()
	  File.open('/tmp/aly_kills_att.txt', 'w') { |file| file.write(url_data) }
	  progress.total = open(url).readlines.size

	  SmarterCSV.process('/tmp/aly_kills_att.txt', {
	    :user_provided_headers => [
	      "att_rank", "grepo_id", "att_points"
	    ], headers_in_file: false
	  }) do |array|

	    array.each do |a|
	      Alliance.where(:grepo_id => a[:grepo_id]).update_all(:att_rank => a[:att_rank], :att_points => a[:att_points])
	      progress.increment
	    end

	  end
	end
end