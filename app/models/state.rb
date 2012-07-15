class State < ActiveRecord::Base
  belongs_to :user
  attr_accessible :new_message
end
