class ImportPkdef
  include Sidekiq::Worker

  require 'smarter_csv'
	require 'open-uri'
	require 'ruby-progressbar'

  # Dont retry Failed Jobs
  sidekiq_options retry: false

  # Import Player Kills Def
  def perform(world)

  	progress = ProgressBar.create( :format         => '%a %bᗧ%i %p%% %t',
	                                 :progress_mark  => ' ',
	                                 :remainder_mark => '･',
	                                 :total          => nil,
	                                 :title          => 'Importing Player Def Bash')

	  url = "http://#{world}.grepolis.com/data/player_kills_def.txt"
	  url_data = open(url).read()
	  File.open('/tmp/player_kills_def.txt', 'w') { |file| file.write(url_data) }
	  progress.total = open(url).readlines.size

	  SmarterCSV.process('/tmp/player_kills_def.txt', {
	      :user_provided_headers => [
	          "def_rank", "grepo_id", "def_points"
	      ], headers_in_file: false
	  }) do |array|

	    array.each do |a|
	      Player.where(:grepo_id => a[:grepo_id]).update_all(:def_rank => a[:def_rank], :def_points => a[:def_points])
	      progress.increment
	    end

	  end
  end

end