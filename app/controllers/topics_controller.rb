class TopicsController < ApplicationController
  def index
    @forum = Forum.find(params[:forum_id])
    @topics = @forum.topics.includes(:posts).order('posts.updated_at DESC')
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build
    @topic.posts.build
  end
  
  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build(params[:topic])
    @topic.last_post_id = Post.count + 1
    if @topic.save
      flash[:success] = "Success!"
      redirect_to topic_posts_path(@topic)
    else
      render 'new'
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic]) 
      flash[:success] = "Success!"
      redirect_to topic_posts_path(@topic)
    else
      render 'edit'
    end
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    forum_id = @topic.forum_id
    @topic.destroy
    flash[:success] = "Topic deleted"
    redirect_to forum_topics_path(forum_id)
  end
end