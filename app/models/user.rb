class User < ActiveRecord::Base
  has_secure_password
  before_save :downcase_email
  has_many :posts

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :password,   presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                    }

  

  def downcase_email
    self.email = email.downcase
  end
end
