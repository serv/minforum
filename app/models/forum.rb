class Forum < ActiveRecord::Base
  attr_accessible :name, :description
  belongs_to :user
  has_many :topics, :dependent => :destroy
  accepts_nested_attributes_for :topics, :allow_destroy => true
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :description, presence: true, length: { maximum: 500 }
  # default_scope order: 'forums.created_at DESC'
end
