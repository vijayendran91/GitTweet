class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: {maximum: 50,minimum: 3}
  validates :description, presence: true, length: {minimum: 3, maximum: 350}
  validates :username, presence: true

end
