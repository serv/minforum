class Topic < ActiveRecord::Base
  include ActiveModel::MassAssignmentSecurity
  
  has_many :posts, :dependent => :destroy
  has_many :flagtopics, :dependent => :destroy
  belongs_to :forum
  belongs_to :user
  accepts_nested_attributes_for :posts, :allow_destroy => true
  attr_accessible :name, :last_post_id, :content, :forum_id
  attr_accessible :name, :last_post_id, :content, :forum_id, :closed, :as => :admin
  before_save :init

  # validations
  validates :name, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :forum_id, presence: true
  validates :content, presence: true, length: { maximum: 50000 }

  def init
    self.views ||= 0
    self.last_post_id ||= Post.count + 1
  end
  
  def assign_attributes(values, options = {})
    sanitize_for_mass_assignment(values, options[:as]).each do |k, v|
      send("#{k}=", v)
    end
  end
end
