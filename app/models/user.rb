class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :username,
    presence: true, 
    uniqueness: { case_sensitive: false }, 
    length: { minimum: 3, maximum: 25}
  
  validates :email, 
    presence: true,
    uniqueness: true, 
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email" } 

  validates :user_type, 
    presence: true,
    inclusion: { in: ["STUDENT", "TEACHER", "ADMIN"] }

  has_secure_password
end