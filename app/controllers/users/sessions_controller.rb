# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include AuthenticateWithOtpTwoFactor

  prepend_before_action :authenticate_with_otp_two_factor,
                        if: -> { action_name == 'create' && otp_two_factor_enabled? }
  
  prepend_before_action :remove_session,
                          if: -> { action_name == 'new' }
  

  protect_from_forgery with: :exception, prepend: true, except: :destroy
end
