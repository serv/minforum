class TopicsController < ApplicationController
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build
  end
  
  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build(params[:topic])
    if @topic.save
      flash[:success] = "Success!"
      redirect_to [@forum, @topic]
    else
      render 'new'
    end
  end
  
  def index
    @topics = Topic.all
  end
  
  def show
    @topic = Topic.find(params[:id])
  end
end