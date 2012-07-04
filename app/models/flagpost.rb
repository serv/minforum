class Flagpost < ActiveRecord::Base
  attr_accessible :post_id, :user_id, :content, :read
  belongs_to :post

  validates :user_id, presence: true, :on => :create
  validates :post_id, presence: true, :on => :create
  validates :content, presence: true, :on => :create
end
