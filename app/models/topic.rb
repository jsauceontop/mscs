class Topic < ActiveRecord::Base
	validates_presence_of :title, :message => "must be provided"
	attr_accessible :title, :description
	has_and_belongs_to_many :mentors
end
