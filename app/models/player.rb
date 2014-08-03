class Player < ActiveRecord::Base

	self.primary_key = 'grepo_id'

	# Versioning
	has_paper_trail on: [:create, :update], ignore: [:grepo_id, :name] 

end
