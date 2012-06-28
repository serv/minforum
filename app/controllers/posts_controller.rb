class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :create, :edit, :update, :destroy]
  
  def index
    @topic = Topic.find(params[:topic_id])
    @topic.views += 1
    if @topic.save
      @forum = Forum.find_by_id(@topic.forum_id)
      @posts = @topic.posts.paginate(page: params[:page])
    else
      render 'index'
    end
  end
  
  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
    @post.user_id = current_user.id

    if @post.save
      @topic.last_post_id = @post.id
      @topic.save
      flash[:success] = "Success!"
      redirect_to topic_posts_path(@topic, :page => "#{last_page(@topic.posts.count)}")
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
      # TODO: need to redirect to right post page
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

  private
    
    def last_page(count)
      if count % 25 > 0
        count/25 + 1
      else
        count/25
      end     
    end

end