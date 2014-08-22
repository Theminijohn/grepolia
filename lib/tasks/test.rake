task :import_test => [:environment] do
  ImportPlayer.perform_async(:de67)
end
