class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.reference :users, null: false
      t.reference :users, null: false, foreign_key: true

      t.timestamp
  end
end
