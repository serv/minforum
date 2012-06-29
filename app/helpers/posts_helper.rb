module PostsHelper
  def post_creator(post)
    User.find_by_id(post.user_id)
  end
  
  def post_creator_name(post)
    post_creator(post).name
  end
end
