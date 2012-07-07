module PostsHelper
  def post_creator(post)
    User.find_by_id(post.user_id)
  end
  
  def topic_name(post)
    topic_for_post(post).name
  end
  
  def topic_for_post(post)
    Topic.find_by_id(post.topic_id)
  end
  
  def post_creator_name(post)
    post_creator(post).name
  end
  
  def reported_post?(post)
    flagpost = Flagpost.where("post_id = ? AND user_id = ?", post.id, current_user.id)
    flagpost.count > 0
  end  
end
