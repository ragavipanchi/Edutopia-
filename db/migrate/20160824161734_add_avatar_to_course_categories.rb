class AddAvatarToCourseCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :course_categories, :avatar, :string
  end
end
