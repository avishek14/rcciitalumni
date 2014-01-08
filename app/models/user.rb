class User < ActiveRecord::Base
	attr_accessor :password

	has_many :topics
	has_many :posts

	before_create { generate_token :auth_token }
	before_save :encrypt_password

	def authenticate pass
		new_hash = BCrypt::Engine.hash_secret pass, self.password_salt
		if  new_hash === self.password_hash
			return true
		end
		false
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret password, password_salt
		end
	end

	def generate_token column
		begin
			self[column] = 	SecureRandom.urlsafe_base64
		end while User.exists? column => self[column]
	end
end
