class MessagesController < ApplicationController
  include MessagesHelper
  before_filter :signed_in_user, only: [:index, :new, :create, :edit, :update]

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(params[:message])
    @message.recipient = find_user_id_for_recipient(@message.to_user)
    if @message.save
      flash[:success] = 'Success!'
      redirect_to @message
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def index
    @messages = Message.where("to_user = ?", current_user.name)
  end

  def sent
    @messages = current_user.messages
  end
end
