class Player < ActiveRecord::Base

	self.primary_key = 'grepo_id'
	has_many :towns
	belongs_to :alliance 

end
