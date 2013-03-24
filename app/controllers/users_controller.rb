class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:list, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  #before_filter :admin_user, only: :destroy

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		sign_in @user
  		flash[:success] = "Welcome to SharePoint Mentors!"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  	#@blogs = @user.blogs.paginate(page: params[:page])
  	@blogs = @user.blogs
  end

  def list
  	@users = User.paginate(page: params[:page])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		#hand successful update
  		flash[:success] = "Profile updated"
  		sign_in @user
  		redirect_to root_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "User destroyed"
  	redirect_to root_path
  end

  private

  def signed_in_user
  	redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
  	@user = User.find(params[:id])
  	redirect_to(root_path) unless current_user?(@user)
  end
end
