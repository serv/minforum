class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy, :setting, :change_password]
  before_filter :correct_user,   only: [:edit, :update, :change_password]
  before_filter :admin_user,     only: [:index, :destroy]

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
      flash[:success] = "Welcome to Minforum, #{@user.name}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def setting
  end

  def edit
  end

  def change_password
  end

  def update
    @user.assign_attributes(params[:user], :as => role_selector)
    if @user.save
      flash[:success] = "Succesfully updated."
      sign_in @user
      redirect_to @user
    else
      flash[:error] = "Updatig failed. Please try again."
      render 'setting'
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
      redirect_to(root_path) unless current_user?(@user) || admin?
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
