class FlagpostsController < ApplicationController
  before_filter :admin_or_mod_user, only: [:edit, :update, :index]

  def new
    @post = Post.find(params[:post_id])
    @flagpost = @post.flagposts.build
  end

  def create
    @post = Post.find(params[:post_id])
    topic = Topic.find(@post.topic_id)
    @flagpost = @post.flagposts.build(params[:flagpost])
    @flagpost.user_id = current_user.id
    if @flagpost.save
      flash[:success] = "Success!"
      redirect_to topic_posts_path(topic)
    else
      redirect_to topic_posts_path(topic)
    end
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

end
