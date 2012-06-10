class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :forum
  accepts_nested_attributes_for :posts
  attr_accessible :name, :last_post_id, :posts_attributes
end
