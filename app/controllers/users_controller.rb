class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome to SharePoint Mentors!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  	#@blogs = @user.blogs.paginate(page: params[:page])
  	@blogs = @user.blogs
  end

end
