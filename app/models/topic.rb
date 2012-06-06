class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :forum
  
  attr_accessible :name
end
