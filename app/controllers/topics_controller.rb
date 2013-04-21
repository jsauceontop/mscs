class TopicsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :edit, :update, :destroy]
  def index
  	@topics = Topic.where(:isApproved => true).order("topics.title ASC")
  end

  def edit
  end

  def new
    @topic = Topic.new
  end

  def create
  	@topic = Topic.new(params[:topic])
    @topic.isApproved = false
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

  def approve
    @topics_ids = params[:topic_ids] ||= []
    @topics_ids.each do |t_id|
      t = Topic.find_by_id(t_id)
      t.update_attributes!(:isApproved => true)
    end
    redirect_to(:action => "index")
  end

end
