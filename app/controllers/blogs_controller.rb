class BlogsController < ApplicationController
  def index
  end

  def new
  	@user = User.find(params[:id])
  end

  def create
  	#@blog = current_user.blogs.build(params[:blog])
  	@user = User.find(params[:id])
  	@blog = @user.blogs.build(params[:blog])
  	#@blog = Blog.new(params[:blog])
  	if @blog.save
  		flash[:success] = "Post created!"
  		redirect_to(:controller => 'pages', :action => 'home')
  	else
  		redirect_to(:controller => 'pages', :action => 'home')
  	end
  end

  def edit
  end

  def show
  end

  def delete

  end

end
