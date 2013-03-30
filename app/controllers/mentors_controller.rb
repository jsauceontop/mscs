class MentorsController < ApplicationController
  def index
  	@mentors = User.all
  end

  def new
  	@mentor = current_user
  end

  def create
  	

  end

end
