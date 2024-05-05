class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password
  has_many :posts
  has_many :comments

  validates :email, 
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 254 },
            format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :username, 
            presence: true,
            uniqueness: true,
            length: { minimum: 6, maximum: 30 }

  validates :password,
            presence: true,
            length: { minimum: 8, maximum: 100 },
            confirmation: true,
            on: :create
end
