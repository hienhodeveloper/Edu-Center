class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :avatar])
  end


  private

  def user_not_authorized
    flash[:alert] = "You are not allow to do this action"
    redirect_to(root_path)
  end
end
