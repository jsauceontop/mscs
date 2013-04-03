require 'bcrypt'

class User < ActiveRecord::Base

	attr_accessible :firstname, :lastname, :username, :email, :password, :password_confirmation, :relatedMentor, :isMentor, :admin, :location
	has_secure_password

	before_save {username.downcase!}
	before_save :create_remember_token

	has_many :blogs, dependent: :destroy
	has_and_belongs_to_many :topics

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}

	validates :firstname, presence: true, length: {maximum: 50}
	validates :lastname, presence: true, length: {maximum: 50}
	validates :username, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive:false}
	validates :password, presence: true, length: {minimum: 6}, :on => :create #no pwd validation for updating or creating user
	validates :password_confirmation, presence: true, :on => :create #no pwd validation for updating or creating user

	def feed
		Blog.where("user_id=?", id)
	end

	private
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end

end
