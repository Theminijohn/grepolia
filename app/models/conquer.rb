class Conquer < ActiveRecord::Base

	# Primary Key
  self.primary_key = 'town_id'

  # Associations
  belongs_to :town, foreign_key: :town_id
  belongs_to :player, foreign_key: :new_player_id
  belongs_to :old_player, class_name: 'Player', foreign_key: :old_player_id
  belongs_to :old_alliance, class_name: 'Alliance', foreign_key: :old_ally_id

  # Public Activity
  include PublicActivity::Common

  def conquer_time
    Time.at(self.time).strftime('%d-%m-%Y, %H:%M')
  end

end
