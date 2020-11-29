class SendOtpMailer < ApplicationMailer
  helper :qr_code
  
  default from: Rails.application.credentials.dig(Rails.env.to_sym, :mail_sender)

  def otp_email
    @email = params[:user].email
    issuer = Rails.application.credentials.dig(Rails.env.to_sym, :otp_2fa_issuer_name)
    label = "#{issuer}:#{@email}"

    # @otp = params[:user].current_otp
    @otp = params[:user].otp_provisioning_uri(label, issuer: issuer)
    mail(to: @email, subject: 'OTP Verification')
  end

  def send_first_password
    @email = params[:email]
    @password = params[:password]
    mail(to: @email, subject: 'Your first password')
  end
end
