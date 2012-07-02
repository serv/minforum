module ForumsHelper
  def total_views(forum)
    views =  0
    forum.topics.each do |topic|
      views += topic.views
    end
    views
  end
  
  def total_posts(forum)
    posts_count = 0
    forum.topics.all.each do |topic|
      posts_count += topic.posts.count
    end
    posts_count
  end
  
  def forum_title(page_title)
    base_title = 'Minforum'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
