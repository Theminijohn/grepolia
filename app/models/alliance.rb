class Alliance < ActiveRecord::Base

	self.primary_key = 'grepo_id'
	has_many :players

end
