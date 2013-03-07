class Topic < ActiveRecord::Base
	validates_presence_of :title, :message => "must be provided"
end
