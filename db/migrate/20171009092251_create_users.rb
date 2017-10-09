class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :username, null: false, unique: true
      t.string :email, null: false
      t.string :password_hash, null: false

      t.timestamps(null: false)
    end
  end
end
