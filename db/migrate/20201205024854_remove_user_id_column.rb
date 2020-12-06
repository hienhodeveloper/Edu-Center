class RemoveUserIdColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :user_id, :integer
  end
end
