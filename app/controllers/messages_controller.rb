class MessagesController < ApplicationController
  include MessagesHelper
  before_filter :signed_in_user, only: [:index, :new, :create, :edit, :update]

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(params[:message])
    @message.recipient = find_user_id_for_recipient(@message.to_user)
    @message.to_user = user_for_id(@message.recipient).name
    if @message.save
      flash[:success] = 'Success!'
      redirect_to messages_sent_path
    else
      render 'new'
    end
  end

  def index
    @messages = Message.where("to_user = ?", current_user.name)
  end

  def sent
    @messages = current_user.messages
  end
end
