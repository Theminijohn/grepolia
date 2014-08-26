####
# Imports all the World Data from Grepolis Server.
###

namespace :populate do
	task :players => [:environment] do
	  Rake::Task['import_players'].invoke
	end

	task :player_kills => [:environment] do
		Rake::Task['player_kills_all'].invoke
		Rake::Task['player_kills_def'].invoke
		Rake::Task['player_kills_att'].invoke
	end

	task :alliances => [:environment] do
		Rake::Task['import_alliances'].invoke
	end

	task :ally_kills => [:environment] do
		Rake::Task['aly_kills_all'].invoke
		Rake::Task['aly_kills_def'].invoke
		Rake::Task['aly_kills_att'].invoke
	end

	task :towns => [:environment] do
		Rake::Task['import_towns'].invoke
	end

	task :conquers => [:environment] do
		Rake::Task['import_conquers'].invoke
	end

	# Invoke All Tasks (Heroku Scheduler Endpoint)
	task :all => [:environment] do
		TASKS = [:players, :player_kills, :alliances,
						 :ally_kills, :towns, :conquers]
		TASKS.each do |t|
			Rake::Task["populate:#{t.to_s}"].invoke
		end
	end
end