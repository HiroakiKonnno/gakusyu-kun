class UserMonth < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :month, :datetime
  end
end
