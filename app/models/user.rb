class User < ApplicationRecord
  attr_accessor :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  
  validates :full_name,
    presence: true, 
    length: { maximum: 25 }

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
      if user
        user
      else
        user = User.create(full_name: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20],
           uid: access_token[:uid],
           provider: access_token[:provider]
        )
      end
  end
end
