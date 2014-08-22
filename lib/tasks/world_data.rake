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

end


# task :populate do
# 	TASKS = [:import_players, :player_kills_all, :player_kills_def,
# 					 :player_kills_att, :import_towns, :import_alliances, :aly_kills_all,
#            :aly_kills_def, :aly_kills_att, :import_conquers]
# 	TASKS.each do |t|
# 		Rake::Task[t.to_s].invoke
# 	end
# end