class User < ActiveRecord::Base
  attr_accessible :name, :email, :password,
                  :password_confirmation, :bio
  attr_accessible :name, :email, :password,
                  :password_confirmation, :bio,
                  :mod, :as => :admin
  has_secure_password
  has_many :forums, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :messages, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  VALID_NAME_REGEX = /\A[[:word:]]+$/i
  validates :name,
            presence: true, :on => :create,
            length: { maximum: 50 },
            format: { with: VALID_NAME_REGEX },
            uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :bio,
            length: { maximum: 2000 }
  validates :password,
            presence: true, :on => :create,
            presence: true, :on => :change_password,
            length: { minimum: 5 }
  validates :password_confirmation,
            presence: true, :on => :create,
            presence: true, :on => :change_password

  def assign_attributes(values, options = {})
    sanitize_for_mass_assignment(values, options[:as]).each do |k, v|
      send("#{k}=", v)
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end