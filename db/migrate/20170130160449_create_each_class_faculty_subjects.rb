class CreateEachClassFacultySubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :each_class_faculty_subjects do |t|
      t.references :faculty, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :each_class, foreign_key: true

      t.timestamps
    end
  end
end
