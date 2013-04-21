class UserMailer < ActionMailer::Base
	default :from => "sharepointmentors@gmail.com"
	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.username} <#{user.email}>", :subject => "Welcome to SharePoint Mentors")
	end

	def mentee_alert(mentor, user)
		@mentor = mentor
		@user = user
		mail(:to => "#{mentor.username} <#{mentor.email}>", :subject => "SharePoint Mentors: New Mentee!")
	end

	def topic_alert()
	end
end
