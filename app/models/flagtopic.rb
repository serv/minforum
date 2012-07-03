class Flagtopic < ActiveRecord::Base
  attr_accessible :topic_id, :user_id, :content, :read
  belongs_to :topic

  validates :user_id, presence: true, :on => :create 
  validates :topic_id, presence: true, :on => :create 
  validates :content, presence: true, :on => :create 
end