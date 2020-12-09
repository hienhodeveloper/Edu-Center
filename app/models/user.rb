class User < ApplicationRecord
  has_one_attached :avatar
  has_many :courses

  has_many :subcribe_courses
  has_many :course, :through => :subcribe_courses

  enum role: [:student, :teacher, :admin]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  
  devise :two_factor_authenticatable, 
         :two_factor_backupable, otp_backup_code_length: 10, otp_number_of_backup_codes: 10,
         :otp_secret_encryption_key => Rails.application.credentials.dig(Rails.env.to_sym, :otp_secret_encryption_key)

  validates :full_name,
    presence: true, 
    length: { maximum: 25 }
  
  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
      if user
        user
      else
        chars = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
        password = chars.sort_by { rand }.join[0...10]
        user = User.create(full_name: data['name'],
           email: data['email'],
           password: password,
           uid: access_token[:uid],
           provider: access_token[:provider],
           role: User.roles.keys[0],
        )
      end
  end

  # Generate an OTP secret it it does not already exist
  def generate_two_factor_secret_if_missing!
    return unless otp_secret.nil?
    update!(otp_secret: User.generate_otp_secret)
  end

  # Ensure that the user is prompted for their OTP when they login
  def enable_two_factor!
    update!(otp_required_for_login: true)
  end

  # Disable the use of OTP-based two-factor.
  def disable_two_factor!
    update!(
        otp_required_for_login: false,
        otp_secret: nil,
        otp_backup_codes: nil)
  end

  # URI for OTP two-factor QR code
  def two_factor_qr_code_uri
    issuer = Rails.application.credentials.dig(Rails.env.to_sym, :otp_2fa_issuer_name)
    label = [issuer, email].join(':')

    otp_provisioning_uri(label, issuer: issuer)
  end

  # Determine if backup codes have been generated
  def two_factor_backup_codes_generated?
    otp_backup_codes.present?
  end
end
