class Town < ActiveRecord::Base

	self.primary_key = 'grepo_id'
	belongs_to :player, foreign_key: :player_id
  has_many :conquers, foreign_key: :town_id

end
