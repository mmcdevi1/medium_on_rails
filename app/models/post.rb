class Post < ActiveRecord::Base
  has_attached_file :attachment, styles: {
    xlarge: "1200x800#",
    large: "1200x800#",
    medium: "300x200#",
    small: "253x170#",
    thumb: "140x140#"
  }
  validates_attachment_content_type :attachment, :content_type => /\Aimage/

  belongs_to :user
  has_many :recommends

  validates :title, presence: true, length: { minimum: 3, maximum: 140 }
  validates :content, presence: true, length: { minimum: 5 }
end
