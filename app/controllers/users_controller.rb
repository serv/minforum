class UsersController < ApplicationController
  # TODO: ability for mod & admin to close topics
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  
  def show
    @user = User.find(params[:id])
    @forums = @user.forums.paginate(page: params[:page])
    @topics = @user.topics.paginate(page: params[:page])
    @posts = @user.posts.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(params[:user])
    User.count == 0 ? @user.admin = true : @user.admin = false
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Minforum!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
