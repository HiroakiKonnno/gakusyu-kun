class LessonMonth < ActiveRecord::Migration[6.1]
  def change
    add_column :lessons, :month, :datetime
  end
end
