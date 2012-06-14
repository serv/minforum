class PostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @forum = Forum.find_by_id(@topic.forum_id)
    @posts = @topic.posts.all
  end
  
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
    if @post.save
      @topic.last_post_id = @post.id
      @topic.save
      flash[:success] = "Success!"
      redirect_to topic_posts_path(@topic)
    else
      render 'new'
    end
  end
  
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      topic = Topic.find(@post.topic_id)
      flash[:success] = "Success!"
      redirect_to topic_posts_path(topic)
    else
      render 'edit'
    end
  end
  
  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to topic_posts_path(@topic)
  end

end