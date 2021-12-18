class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.datetime :planed_day
      t.datetime :completed_day
      t.string :lesson_id
      t.timestamps
    end
  end
end
