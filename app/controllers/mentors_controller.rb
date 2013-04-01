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

  	#@topics = current_user.topics.build(params[:topics])
    # if (@user.password != params[:password])
    #   @topics = Topic.all
    #   flash[:failure] = "Invalid Password. Try again"
    #   render 'new', :error => @user.errors
    # else
    
    @user.location = params[:location]
    	if @user.save
    		flash[:success] = "You're now a mentor!"
    		redirect_to root_url
    	else
        @topics = Topic.all
        render 'new', :error => @user.errors
    	end
    #end
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
