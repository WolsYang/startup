class Mission < ApplicationRecord
	has_many :works
	has_many :mission_tags
	has_many :users, through: :works
	
	validates :name, :state, :level, :supervisor, presence: true
	validates :name, length: {maximum: 200}
	
end
