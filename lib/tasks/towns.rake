require 'smarter_csv'
require 'open-uri'
require 'ruby-progressbar'
desc "Import Towns"

task :import_towns => [:environment] do

  progress = ProgressBar.create( :format         => '%a %bᗧ%i %p%% %t',
                                 :progress_mark  => ' ',
                                 :remainder_mark => '･',
                                 :total          => nil,
                                 :title          => 'Importing Towns')

  url = "http://de67.grepolis.com/data/towns.txt"
  url_data = open(url).read()
  File.open('/tmp/towns.txt', 'w') { |file| file.write(url_data) }
  progress.total = open(url).readlines.size

  SmarterCSV.process('/tmp/towns.txt', {
    :user_provided_headers => [
      "grepo_id", "player_id", "name", "island_x", "island_y", "slot", "points"
    ], headers_in_file: false
  }) do |array|

    array.each do |a|
      a[:name] = a[:name].to_s
      a[:name] = CGI::unescape(a[:name]).force_encoding('UTF-8')

      # Town's Ocean and Coordinates 
      x = a[:island_x].to_s
      y = a[:island_y].to_s
      a[:ocean] = [x[0,1], y[0,1]].join('')
      a[:coordinates] = [x,y].join('|')

      Town.where(:grepo_id => a[:grepo_id]).first_or_initialize.update_attributes(a)
      progress.increment
    end

  end

end
