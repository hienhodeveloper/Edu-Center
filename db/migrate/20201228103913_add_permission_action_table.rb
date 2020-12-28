class AddPermissionActionTable < ActiveRecord::Migration[6.0]
  def change
    create_table :permission_actions do |t|
      t.string :action_name, null: false
      t.string :action_code, null: false
      t.timestamps
    end
  end
end
