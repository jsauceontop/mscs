class Blog < ActiveRecord::Base
	attr_accessible :content, :user_id, :title
	belongs_to :user

	validates :title, presence: true
	validates :user_id, presence: true
	validates :content, presence: true, length: {maximum:5000 }

	default_scope order: 'blogs.created_at DESC'
end
