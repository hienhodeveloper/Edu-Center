class ManageUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize [current_user], :index?, policy_class: UserPolicy
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    if @user
      authorize @user, :show?, policy_class: UserPolicy
    else
      flash[:notice] = "Not found user"
      redirect_to(root_path)
    end
  end
end
