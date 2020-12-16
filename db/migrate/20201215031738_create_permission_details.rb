class CreatePermissionDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :permission_details do |t|
      t.string :action_code, null: false
      t.integer :permission_id, null:false
      t.timestamps
    end
  end
end
