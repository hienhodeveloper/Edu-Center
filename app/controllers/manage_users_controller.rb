class ManageUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize [current_user], :index?, policy_class: UserPolicy
    @users = policy_scope(User)
  end

  def show
    @user = policy_scope(User).find(params[:id])
    authorize [current_user, @user], :show?, policy_class: UserPolicy
  end
end
