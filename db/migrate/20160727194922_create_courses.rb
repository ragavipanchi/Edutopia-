class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_description
      t.float :course_cost
      t.timestamps null: false
    end
  end
end
