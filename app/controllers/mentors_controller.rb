class MentorsController < ApplicationController
  def index
  	@mentors = User.where(:isMentor => true)
  end

  def new
  	@mentor = current_user
  end

  def create
  	

  end

end
