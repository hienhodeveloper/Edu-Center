class Permission < ApplicationRecord
  has_many :user_permissions
  has_many :permission_details
end
