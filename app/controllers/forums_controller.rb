class ForumsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @forum = current_user.forums.build
  end
  
  def create
    @forum = current_user.forums.build(params[:forum])
    if @forum.save
      flash[:success] = "Forum created!"
      redirect_to forum_topics_path(@forum)
    else
      render 'new'
    end
  end
  
  def index
    @forums = Forum.all
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:forum])
      flash[:success] = "Success!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy
    redirect_to root_path
  end
end