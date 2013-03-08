class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def edit
  end

  def new
  end

end
