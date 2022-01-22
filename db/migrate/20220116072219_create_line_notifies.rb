class CreateLineNotifies < ActiveRecord::Migration[6.1]
  def change
    create_table :line_notifies do |t|

      t.timestamps
    end
  end
end
