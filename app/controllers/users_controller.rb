class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  	#@blogs = @user.blogs.paginate(page: params[:page])
  	@blogs = @user.blogs
  end

end
