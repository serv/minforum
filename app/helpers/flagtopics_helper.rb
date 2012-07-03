module FlagtopicsHelper
  def flag_topic(flagtopic)
    Topic.find(flagtopic.topic_id)
  end

  def flag_topic_name(flagtopic)
    flag_topic(flagtopic).name
  end
  
  def flag_user(flagtopic)
    User.find(flagtopic.user_id)
  end
  
  def flag_user_name(flagtopic)
    flag_user(flagtopic).name
  end
end
