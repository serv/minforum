class Message < ActiveRecord::Base
  attr_accessible :content, :recipient, :sender, :subject, :to_user
  belongs_to :user
end
