require 'smarter_csv'
require 'open-uri'
require 'ruby-progressbar'
desc "Import Conquers"

task :import_conquers => [:environment] do

  progress = ProgressBar.create( :format         => '%a %bᗧ%i %p%% %t',
                                 :progress_mark  => ' ',
                                 :remainder_mark => '･',
                                 :total          => nil,
                                 :title          => 'Importing Conquers')

  url = "http://de67.grepolis.com/data/conquers.txt"
  url_data = open(url).read()
  File.open('/tmp/conquers.txt', 'w') { |file| file.write(url_data) }
  progress.total = open(url).readlines.size

  SmarterCSV.process('/tmp/conquers.txt', {
      :user_provided_headers => [
          "town_id", "time", "new_player_id", "old_player_id", "new_ally_id", "old_ally_id", "town_points"
      ], headers_in_file: false
  }) do |array|

    array.each do |a|
      
      # Internal Conquer 
      if a[:old_ally_id] == a[:new_ally_id]
        a[:intern] = true
      end
      
      # Rescue in case the Player deletes his Account
      @player = Player.find_by_grepo_id(a[:old_player_id])
      a[:old_player_name] = @player.name if @player.present?
  
      # Rescue in case an Alliance is resolved 
      @alliance =  Alliance.find_by_grepo_id(a[:old_ally_id]) 
      a[:old_alliance_name] = @alliance.name if @alliance.present?
  
      # If it's an abandonded town
      if @player.nil? && @alliance.nil?
        a[:old_player_name] = "Abandoned"
        a[:old_alliance_name] = "-"
      end

      Conquer.where(:town_id => a[:town_id]).first_or_initialize.update_attributes(a)
      @pl = Player.find_by_grepo_id(a[:new_player_id])
      if @pl.present? && @pl.followers.count > 0
        @pl.followers.each do |follower|
          @pl.create_activity action: 'conquered_town', recipient: follower
        end
      end
      progress.increment

      # Need to implement checking for timestampes to don't create duplicate activities

      # if @owner = Player.find(params[:new_player_id]).present?
      #   if @owner.followers.count > 0
      #     @conquer.create_activity :create, recipient: @owner.followers
      #   end
      # end

    end

  end

end 

