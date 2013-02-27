class User < ActiveRecord::Base
  has_secure_password
  has_many :topics, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :username, :email, :password
  validates_confirmation_of :password_confirmation

  before_save { username.downcase! }
  before_save { email.downcase! }
  before_save :create_remember_token

  def to_param
    username
  end

protected

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
