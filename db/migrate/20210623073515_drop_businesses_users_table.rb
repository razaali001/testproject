class DropBusinessesUsersTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :users_businesses
  end
end
