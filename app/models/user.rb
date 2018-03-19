class User < ActiveRecord::Base
  has_many :articles
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true,format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true, length: {minimum: 3, maximum: 25}
  has_secure_password
end
