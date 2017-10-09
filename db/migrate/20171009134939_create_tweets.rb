class CreateTweets < ActiveRecord::Migration[5.0]
  def change
     create_table :tweets do |t|
      t.string :posts, null: false, limit: 140
      t.string :user_id, foreign_key: true

      t.timestamps
    end
  end
end
