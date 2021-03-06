class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:edit, :update, :destroy]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      UserMailer.registration_confirmation(@user).deliver
  		sign_in @user
  		flash[:success] = "Welcome to SharePoint Mentors!"
  		redirect_to @user #root_path
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
    @mentees = []
    User.all.each do |u|
      if u.relatedMentor == @user.username
        @mentees << u
      end
    end
  	@blogs = @user.blogs.paginate(page: params[:page])
  end

  def index
  	@users = User.paginate(page: params[:page])
  end

  def edit
    @topics = Topic.where(:isApproved => true).order("topics.title ASC")
  	@user = User.find(params[:id])
    if !current_user?(@user)
      redirect_to root_path
    end
  end

  def update
  	#@user = User.find(params[:id])
    @user = current_user  
    @user.update_attributes(params[:user])
    @user.location = params[:location]
    @user.isMentor = params[:isMentor]

    #if user is no longer a mentor, need to update all mentees
    if @user.isMentor ==false
      User.all.each do |u|
        if u.relatedMentor == @user.username
          u.relatedMentor = ""
          u.save
          #notify all mentees
          UserMailer.nomentor_alert(u).deliver
        end
      end
    end

    #associate the topics to the mentor
    @topics = params[:user][:topic_ids] ||= []
    @user.topic_ids = @topics

  	if @user.save
  		flash[:success] = "Profile updated"
  		sign_in @user
  		redirect_to @user #root_path
  	else
  		render 'edit'
  	end
  end

  def destroy
    @user = User.find(params[:id])
    #if user is a mentor, need to update all mentees
    if @user.isMentor == true
      User.all.each do |u|
        if u.relatedMentor == @user.username
          u.relatedMentor = ""
          u.save
          #notify all mentees
          UserMailer.nomentor_alert(u).deliver
        end
      end
    end

    if @user.destroy
    	flash[:success] = "Account destroyed"
    	redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
      #redirect_to(root_path) unless current_user.admin?
  end

end
