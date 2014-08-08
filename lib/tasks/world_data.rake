desc 'Importing World Data'

task :populate do

	TASKS = [:import_players, :player_kills_all, :player_kills_def,
					 :player_kills_att, :import_towns, :import_alliances, :aly_kills_all,
           :aly_kills_def, :aly_kills_att, :import_conquers]

	TASKS.each do |t|
		Rake::Task[t.to_s].invoke
	end

end
