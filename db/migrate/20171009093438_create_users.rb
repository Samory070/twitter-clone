class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :hash_password, null: false

      t.timestamp
    end
  end
end
