module TopicsHelper
  def topic_creator(topic)
    User.find_by_id(topic.user_id)
  end
  
  def topic_creator_name(topic)
    topic_creator(topic).name
  end
  
  def last_post(topic)
    Post.find_by_id(topic.last_post_id)
  end
  
  def last_post_creator(topic)
    User.find_by_id(last_post(topic).user_id)
  end
  
  def last_post_creator_name(topic)
    last_post_creator(topic).name
  end

  
end
