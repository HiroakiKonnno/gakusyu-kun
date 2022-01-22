class UserMonth < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :month, :datetime
  end
end
