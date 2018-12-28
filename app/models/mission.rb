class Mission < ApplicationRecord
	has_many :works, counter_cache: true
	has_many :users, through: :works
end
