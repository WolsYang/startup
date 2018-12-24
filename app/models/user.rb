class User < ApplicationRecord
	has_many :works
	has_many :missions, through: :works
end
