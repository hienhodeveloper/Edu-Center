class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :name_per, null: false
      t.timestamps
    end
  end
end
