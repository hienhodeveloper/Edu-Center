class AddRelationPermissionAction < ActiveRecord::Migration[6.0]
  def change
    remove_column :permission_details, :action_name, :string
    remove_column :permission_details, :action_code, :string

    add_column :permission_details, :licensed, :boolean, :default => true
    add_column :permission_details, :permission_action_id, :integer
  end
end
