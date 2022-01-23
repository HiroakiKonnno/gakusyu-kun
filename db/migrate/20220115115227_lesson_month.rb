class LessonMonth < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :month, :datetime
  end
end
