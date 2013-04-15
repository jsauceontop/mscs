class UserMailer < ActionMailer::Base
	default :from => "sharepointmentors@gmail.com"
	def registration_confirmation(user)
		@user = user
		mail(:to => "#{user.username} <#{user.email}>", :subject => "Welcome to SharePoint Mentors")
	end
end
