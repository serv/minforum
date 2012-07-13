class Message < ActiveRecord::Base
  attr_accessible :content, :recipient, :sender, :subject, :to_user
  belongs_to :user
  
  validates :to_user, presence: true
  validates :subject, length: { maximum: 140 }
  validates :content, presence: true, length { maximum: 20000 }
end
