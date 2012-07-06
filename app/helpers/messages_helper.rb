module MessagesHelper
  def find_user_id_for_recipient(to_user)
    User.find_by_name(to_user).id
  end
  
  def user_for_id(user_id)
    User.find(user_id)
  end
  
  def user_for_id_in_name(user_id)
    user_for_id(user_id).name
  end
end
