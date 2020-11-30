class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.string :address
      t.text :goal
      t.text :condition
      t.text :degree
      t.text :course_content
      t.string :status

      t.timestamps
    end
  end
end
