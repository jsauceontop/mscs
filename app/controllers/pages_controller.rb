class PagesController < ApplicationController

  def home
  	if signed_in?
	  	@blog = current_user.blogs.build
	  	@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def contact
  end

  def faqs
  end

  def admin
    @user = current_user
    @topics = Topic.where(:isApproved => false).order("topics.title ASC")
  end

end
