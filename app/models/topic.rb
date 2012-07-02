class Topic < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  belongs_to :forum
  belongs_to :user
  accepts_nested_attributes_for :posts, :allow_destroy => true
  attr_accessible :name, :last_post_id, :content
  before_save :init

  # validations
  validates :name, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :forum_id, presence: true
  validates :content, presence: true, length: { maximum: 50000 }
  
  def init
    self.views ||= 0
    self.last_post_id ||= Post.count + 1
  end
end
