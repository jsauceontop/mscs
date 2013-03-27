class BlogsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
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
      render 'pages/home'
  	end
  end

  def edit
  end

  def show
  end

  def delete
    @blog.destroy
    redirect_to root_url
  end

  private

  def correct_user
    @blog = current_user.blogs.find_by_id(params[:id])
    redirect_to root_url if @blog.nil?
  end

end
