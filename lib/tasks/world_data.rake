####
# Imports all the World Data from Grepolis Server.
# Passed to Sidekiq Workers for Async work.
###

namespace :populate do

	task :players => [:environment] do
	  ImportPlayer.perform_async(:de67)
	end

	task :player_kills => [:environment] do
		ImportPkall.perform_async(:de67)
		ImportPkdef.perform_async(:de67)
		ImportPkatt.perform_async(:de67)
	end

	task :alliances => [:environment] do
		ImportAlliance.perform_async(:de67)
	end

	task :ally_kills => [:environment] do
		ImportAkall.perform_async(:de67)
		ImportAkdef.perform_async(:de67)
		ImportAkatt.perform_async(:de67)
	end

	task :towns => [:environment] do
		ImportTown.perform_async(:de67)
	end

	task :conquers => [:environment] do
		ImportConquer.perform_async(:de67)
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