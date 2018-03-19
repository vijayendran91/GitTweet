class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: {maximum: 50,minimum: 3}
  validates :description, presence: true, length: {minimum: 3, maximum: 350}
  validates :user_id, presence: true  

end