class User < ApplicationRecord
	has_secure_password
	
	has_many :works ,counter_cache: true
	has_many :missions, through: :works
	
	validates :name, presence: true
	validates :email,  format: { with: /\A[^@]+@[^@]+\z/}, uniqueness: true
end
