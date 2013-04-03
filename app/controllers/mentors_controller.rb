class MentorsController < ApplicationController
  before_filter :signed_in_user

  def index
  	@mentors = User.where(:isMentor => true)
  end

  def new
  	@topics = Topic.all
    @user = current_user
  end

  def create
    @user = current_user  
    @user.location = params[:location]
    @user.isMentor = true

    #associate the topics to the mentor
    @topics = params[:user][:topic_ids] ||= []
    @user.topic_ids = @topics

  	if @user.save
  		flash[:success] = "You're now a mentor!"
  		redirect_to @user
  	else
      @topics = Topic.all
      render 'new', :error => @user.errors
  	end
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
      redirect_to(root_path) unless current_user.admin?
  end

end
