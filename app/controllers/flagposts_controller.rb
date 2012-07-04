class FlagpostsController < ApplicationController
  include SessionsHelper

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
    @flagposts = Flagpost.where(:read => false)
  end

  def edit
    @post = Post.find(params[:post_id])
    @flagpost = @post.flagposts.find(params[:id])
  end

  def update
    @flagpost = Flagpost.find(params[:id])
    post = Post.find(@flagpost.post_id)
    if @flagpost.update_attributes(params[:flagpost])
      flash[:success] = "Success!"
      redirect_to post_flagposts_path
    else
      redirect_to edit_post_flagpost_path(post, @flagpost)
    end
  end

end