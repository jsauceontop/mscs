class Mentor < ActiveRecord::Base
	validates_presence_of :firstname, :message => "must be provided"
	attr_accessible :firstname, :lastname, :profile
	has_and_belongs_to_many :topics
end
