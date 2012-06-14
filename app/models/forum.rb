class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  accepts_nested_attributes_for :topics, :allow_destroy => true
  attr_accessible :name, :description
end
