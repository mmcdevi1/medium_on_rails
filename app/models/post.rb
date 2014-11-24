class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 140 }
  validates :content, presence: true, length: { minimum: 5 }
end
