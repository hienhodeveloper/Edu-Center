class CreateUserPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_permissions do |t|
      t.boolean :licensed, null: false
      t.integer :permission_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
