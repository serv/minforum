module MessagesHelper
  def find_user_id_for_recipient(to_user)
    User.find(:first, :conditions => ["lower(name) = ?", to_user.downcase]).id
  end

  def user_for_id(user_id)
    User.find(user_id)
  end

  def user_for_id_in_name(user_id)
    user_for_id(user_id).name
  end

  def user_got_a_message(recipient_id)
    recipient = user_for_id(recipient_id)
    recipient.new_message = true
    recipient.save
  end

  def messages_being_read(messages)
    messages.where('read < ?', 3).each do |message|
      message.read += 1
      message.save
    end
  end

  def is_read?(message)
    message.read > 2
  end

  def current_user_has_no_new_message
    @user = current_user
    if @user.new_message == true
      @user.new_message = false
      @user.save
      sign_in @user
      redirect_to messages_path
    end
  end
end
