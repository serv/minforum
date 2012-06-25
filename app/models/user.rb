class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  
  VALID_NAME_REGEX = /\A[[:word:]]+$/i
  validates :name,  presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX },
                    uniqueness: { case_sensitive: false }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true
end