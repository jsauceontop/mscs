class SessionsController < ApplicationController
	def new
		#@session = Session.new
	end

	def create
		user = User.find_by_username(params[:session][:username].downcase)
		if user && user.authenticate(params[:session][:password])
			#sign the user in and redirect to the user's show page
			sign_in user
			redirect_to user
		else
			flash[:error] = 'Invalid username/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
