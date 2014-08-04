class Alliance < ActiveRecord::Base

	self.primary_key = 'grepo_id'

  has_paper_trail on: [:create, :update], ignore: [:grepo_id, :name] 
	
	has_many :players

end
