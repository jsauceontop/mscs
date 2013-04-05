class BlogsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
    @blog = Blog.new
  end

  def new
  	@user = User.find(params[:id])
  end

  def create
  	@blog = current_user.blogs.build(params[:blog])
  	if @blog.save
  		flash[:success] = "Post created!"
  		redirect_to root_url
  	else
  		@feed_items = []
      render 'index'
  	end
  end

  def edit
    @blog = Blog.find(params[:id])

  end

  def update
    #@blog = Blog.find(params[:id])
    @blog.title = params[:title]
    @blog.content = params[:content]
    @blog.user_id = current_user.id

    if @blog.save
      flash[:success] = "Post updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
  end

  def delete
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "Post deleted!"
    redirect_to root_url
  end

  private

  def correct_user
    @blog = current_user.blogs.find_by_id(params[:id])
    redirect_to root_url if @blog.nil?
  end

end
