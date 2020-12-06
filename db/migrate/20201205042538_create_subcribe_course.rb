class CreateSubcribeCourse < ActiveRecord::Migration[6.0]
  def change
    create_table :subcribe_courses do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.timestamps
    end
  end
end
