class TopicsController < ApplicationController
  def index
  	@topics = Topic.order("topics.title ASC")
  end

  def edit
  end

  def new
    @topic = Topic.new
  end

  def create
  	@topic = Topic.new(params[:topic])
  	if @topic.save
      flash[:success] = "Topic Suggested!"
      #email?
  		redirect_to(:action => "index")
  	else
  		render("new")
  	end
  end

  def show
  	@topic = Topic.find(params[:id])
    @mentors = []
    User.all.each do |user|
      if user.topics.include?(@topic) && user.isMentor == true
        @mentors << user
      end
    end
  end

end
