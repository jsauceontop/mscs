ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587,
	:domain => "gmail.com",
	:user_name => "sharepointmentors@gmail.com",
	:password => "@MSDeveloper1",
	:authentication => "plain",
	:enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "sharepointmentors.herokuapp.com"