class Player < ActiveRecord::Base

	self.primary_key = 'grepo_id'
	has_many :towns
	belongs_to :alliance 
  has_many :conquers, class_name: 'Conquer', foreign_key: :new_player_id

end
