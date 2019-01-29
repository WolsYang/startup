class User < ApplicationRecord
	has_secure_password
	
	has_many :works 
	has_many :missions, through: :works
	
	validates :name, presence: true
	validates :email,  format: { with: /\A[^@]+@[^@]+\z/}, uniqueness: true

	private	
	def admin?
  		self.role == "admin"
	end

end
