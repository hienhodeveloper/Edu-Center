class RemoveBelongToOfCourse < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :belong_to, :integer
    add_column :courses, :user_id, :integer
  end
end
