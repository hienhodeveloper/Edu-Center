class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
