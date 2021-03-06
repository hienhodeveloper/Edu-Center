# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super do |user|
      UserPermission.create({user_id: user.id, permission_id: 6, licensed: true})
      if user.teacher?
        t = Permission.create({name_per: "Teacher #{user.id}"})
        UserPermission.create({user_id: user.id, permission_id: t.id, licensed: true})
        PermissionDetail.create([
          {
            permission_id: t.id,
            permission_action_id: 1,
            licensed: true,
          },
          {
            permission_id: t.id,
            permission_action_id: 2,
            licensed: true,
          },
          {
            permission_id: t.id,
            permission_action_id: 3,
            licensed: true,
          },
          {
            permission_id: t.id,
            permission_action_id: 10,
            licensed: true,
          },
        ])
      end
      if user.student?
        t = Permission.create({name_per: "Student #{user.id}"})
        UserPermission.create({user_id: user.id, permission_id: t.id, licensed: true})
        PermissionDetail.create([
          {
            permission_id: t.id,
            permission_action_id: 4,
            licensed: true,
          },
          {
            permission_id: t.id,
            permission_action_id: 5,
            licensed: true,
          }
        ])
      end
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  #   # If you have extra params to permit, append them to the sanitizer.
  #   def configure_sign_up_params
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :role])
  #   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
