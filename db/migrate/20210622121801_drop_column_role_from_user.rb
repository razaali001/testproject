class DropColumnRoleFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :role_id, :bigint
  end
end
