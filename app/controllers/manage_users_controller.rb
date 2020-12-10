class ManageUsersController < ApplicationController
  before_action :authenticate_user!

  def users
    @users = policy_scope(User)
  end

  def user_profile
    @user = policy_scope(User).find(params[:id])
    authorize [current_user, @user], :user_profile, policy_class: UserPolicy
  end
end
