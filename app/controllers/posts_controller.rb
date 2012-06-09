class PostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts.find_all_by_topic_id(params[:topic_id])
  end
  
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
  end
  
  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.find(params[:topic_id])
    @post = @forum.topics.find(params[:topic_id]).posts.build(params[:post])
    if @post.save
      flash[:success] = "Success!"
      redirect_to forum_topic_posts_path(@forum, @topic)
    else
      render 'new'
    end
  end

end