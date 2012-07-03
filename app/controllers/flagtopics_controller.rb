class FlagtopicsController < ApplicationController
  include SessionsHelper

  before_filter :admin_or_mod_user, only: [:edit, :update, :index]

  def new
    @topic = Topic.find(params[:topic_id])
    @flagtopic = @topic.flagtopics.build
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @flagtopic = @topic.flagtopics.build(params[:flagtopic])
    @flagtopic.user_id = current_user.id
    if @flagtopic.save
      flash[:success] = "Success!"
      redirect_to topic_posts_path(@topic)
    else
      redirect_to topic_posts_path(@topic)
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @flagtopic = @topic.flagtopics.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @flagtopic = @topic.flagtopics.find(params[:id])
  end

  def update
    @flagtopic = Flagtopic.find(params[:id])
    topic = Topic.find(@flagtopic.topic_id)
    if @flagtopic.update_attributes(params[:flagtopic])
      flash[:success] = "Success!"
      redirect_to topic_flagtopics_path
    else
      redirect_to edit_topic_flagtopic_path(topic, @flagtopic)
    end
  end

  def index
    @flagtopics = Flagtopic.where(:read => false)
  end
end