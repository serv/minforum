class TopicsController < ApplicationController
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build
    @topic.posts.build
  end
  
  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build(params[:topic])
    if @topic.save
      flash[:success] = "Success!"
      redirect_to topic_posts_path(@topic)
    else
      render 'new'
    end
  end
  
  def index
    @forum = Forum.find(params[:forum_id])
    @topics = @forum.topics.find_all_by_forum_id(params[:forum_id])
  end
  
  def show
    @topic = Topic.find(params[:id])
  end
end