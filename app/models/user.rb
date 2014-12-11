class User < ActiveRecord::Base
  has_secure_password
  
  has_many :posts
  has_many :recommends

  before_create { |user| user.email = user.email.downcase }                  
  before_create :create_remember_token

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :password,   presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                    }
  

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
