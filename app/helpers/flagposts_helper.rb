module FlagpostsHelper
  def flag_post(flagpost)
    Post.find(flagpost.post_id)
  end
  
  def flag_post_name(flagpost)
    flag_post(flagpost).name
  end
  
  def topic_of_flag_post(flagpost)
    Topic.find(flag_post(flagpost).topic.id)
  end
end
