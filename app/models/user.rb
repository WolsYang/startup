class User < ApplicationRecord
	has_many :works ,counter_cache: true
	has_many :missions, through: :works
end
