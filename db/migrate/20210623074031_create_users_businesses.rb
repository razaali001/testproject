class CreateUsersBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :users_businesses do |t|
      t.references :business, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
