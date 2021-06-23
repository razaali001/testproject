class CreateBusinessesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses_users do |t|
      t.references :user, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
