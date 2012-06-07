class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :forum
  accepts_nested_attributes_for :posts
  attr_accessible :name, :posts_attributes
end
