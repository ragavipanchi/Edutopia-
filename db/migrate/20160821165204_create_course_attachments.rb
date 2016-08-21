class CreateCourseAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :course_attachments do |t|
      t.integer :course_id
      t.string :avatar

      t.timestamps
    end
  end
end
