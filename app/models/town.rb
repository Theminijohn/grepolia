class Town < ActiveRecord::Base

	self.primary_key = 'grepo_id'
	belongs_to :player, foreign_key: :player_id

end
