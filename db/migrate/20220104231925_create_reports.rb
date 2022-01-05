class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.datetime :reported_day
      t.text :note, null: false
      t.text :comment, null: false
      t.time :study_time
      t.string :user_id
      t.boolean :confiramtion, default: false, null: false
      t.timestamps
    end
  end
end
