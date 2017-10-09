class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :following do |t|
      t.integer :from_user_id
      t.integer :to_user_id

      t.timestamps(null: false)
    end
  end
end
