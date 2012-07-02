class FlagtopicsController < ApplicationController
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
end