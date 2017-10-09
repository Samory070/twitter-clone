class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text, length: { maximum: 140 }
      t.integer :user_id

      t.timestamps
    end
    add_index :tweets, :user_id
  end
end
