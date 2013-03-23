class Mentor < ActiveRecord::Base
	inherits_from :user

	attr_accessible :profile
	has_and_belongs_to_many :topics


end
