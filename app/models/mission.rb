class Mission < ApplicationRecord
	has_many :works, counter_cache: true
	has_many :users, through: :works
	
	validates :name, :state, :level, :supervisor, presence: true
	validates :name, length: {maximum: 200}
	#validates :kind, allow_nil: true
end
