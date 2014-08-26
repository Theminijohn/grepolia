class Player < ActiveRecord::Base
  
  # Public Activity
  include PublicActivity::Common
  
  # Primary Key
	self.primary_key = 'grepo_id'

  # Associations
	has_many :towns
	belongs_to :alliance, touch: true
  has_many :conquers, class_name: 'Conquer', foreign_key: :new_player_id

  # Followable
  acts_as_followable

end
