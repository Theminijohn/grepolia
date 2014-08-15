class Player < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked

	self.primary_key = 'grepo_id'

	has_many :towns
	belongs_to :alliance 
  has_many :conquers, class_name: 'Conquer', foreign_key: :new_player_id

end
