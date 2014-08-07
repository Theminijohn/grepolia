class Town < ActiveRecord::Base

	self.primary_key = 'grepo_id'

	has_paper_trail on: :update, only: [:player_id, :name, :points] 
	
	belongs_to :player, foreign_key: :player_id



end
