class Forum < ActiveRecord::Base
  has_many :topics
  accepts_nested_attributes_for :topics
  
  attr_accessible :name, :description
end
