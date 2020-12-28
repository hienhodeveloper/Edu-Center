class PermissionDetail < ApplicationRecord
  belongs_to :permission
  belongs_to :permission_action
end
