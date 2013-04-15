class BlogsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
    @blog = Blog.new
    @user = current_user
    if !@user.nil? #if no user is signed in
      @blogs = @user.blogs.all
    else
      @blogs = nil
    end
  end

  def new
  	@user = User.find(params[:id])
  end

  def create
  	@blog = current_user.blogs.build(params[:blog])
  	if @blog.save
  		flash[:success] = "Post created!"
  		redirect_to current_user
  	else
  		@feed_items = []
      render 'index'
  	end
  end

  def edit
    @blog = Blog.find(params[:id])

  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(params[:blog])
      flash[:success] = "Post updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def delete
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "Post deleted!"
    redirect_to current_user
  end

  private

  def correct_user
    @blog = current_user.blogs.find_by_id(params[:id])
    redirect_to root_url if @blog.nil?
  end

end
