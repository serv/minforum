class TopicsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @forum = Forum.find(params[:forum_id])
    @topics = @forum.topics.includes(:posts).order('posts.updated_at DESC').paginate(page: params[:page])
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build(params[:topic])
    @topic.user_id = current_user.id
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
    @topic.assign_attributes(params[:topic], :as => role_selector)
    if @topic.save
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
  
  private
  
    def role_selector
      if admin?
        :admin
      else
        :default
      end
    end
end