class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :content
  
  # validation
  validates :content, :presence => true,
                      :length => { :maximum => 50000 }
  validates :topic_id, :presence => true
  validates :user_id, :presence => true
  validate :cannot_create_replies_to_closed_topic
  
  # custom validation methods
  def cannot_create_replies_to_closed_topic
    topic = Topic.find_by_id(topic_id)
    if topic.closed?
      errors.add(:content, "can't be created for a topic that is closed")
    end
  end
end
