class User < ActiveRecord::Base
	acts_as_superclass

	attr_accessible :firstname, :lastname, :username, :email
	has_many :blogs, dependent: :destroy

	validates :firstname, presence: true, length: {maximum: 50}
	validates :lastname, presence: true, length: {maximum: 50}

	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive:}

	#before_save {|user| user.email = email.downcase}

end
