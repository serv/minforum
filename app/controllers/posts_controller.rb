class PostsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @posts = @topic.posts.find_all_by_topic_id(params[:topic_id])
  end
end