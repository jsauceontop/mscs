require 'bcrypt'

class User < ActiveRecord::Base

	attr_accessible :firstname, :lastname, :username, :email, :password, :password_confirmation
	has_secure_password

	has_many :blogs, dependent: :destroy
	has_and_belongs_to_many :topics

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

	validates :firstname, presence: true, length: {maximum: 50}
	validates :lastname, presence: true, length: {maximum: 50}
	validates :username, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive:false}
	validates :password, presence: true, length: {minimum: 6}
	validates :password_confirmation, presence: true

	before_save {|user| user.username = username.downcase}

	def self.authenticate(username, password)
		find_by_username(username).try(:authenticate, password)
	end

end
