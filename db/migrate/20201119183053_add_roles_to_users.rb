class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :student, :boolean
    add_column :users, :admin, :boolean
    add_column :users, :teacher, :boolean
  end
end
