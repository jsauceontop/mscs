class Topic < ActiveRecord::Base
	validates_presence_of :title, :message => "must be provided"
	attr_accessible :title, :description
	belongs_to :users
end
