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

  def update_per
    per = PermissionDetail.where(id: params[:per_id])
    if per.exists? && current_user.admin?
      if params[:action_p] == 'inactive'
        per.update(licensed: false)
        redirect_to manage_users_path(params[:u_id])
      end
  
      if params[:action_p] == 'active'
        per.update(licensed: true)
        redirect_to manage_users_path(params[:u_id])
      end
    end
  end
end
