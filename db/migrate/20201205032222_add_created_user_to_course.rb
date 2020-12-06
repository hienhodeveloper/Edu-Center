class AddCreatedUserToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :belong_to, :integer
  end
end
