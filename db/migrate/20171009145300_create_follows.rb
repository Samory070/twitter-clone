class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id, null: false, foreign_key: true, index: true
      t.integer :followed_id, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
