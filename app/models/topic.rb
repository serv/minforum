class Topic < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  belongs_to :forum
  accepts_nested_attributes_for :posts, :allow_destroy => true
  attr_accessible :name, :last_post_id, :posts_attributes
end
