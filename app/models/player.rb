class Player < ActiveRecord::Base

	self.primary_key = 'grepo_id'

	has_paper_trail on: [:create, :update], ignore: [:grepo_id, :name] 

	has_many :towns
	belongs_to :alliance 

end
