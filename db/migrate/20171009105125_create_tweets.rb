class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :tweet_text, null: false
      t.references :user, foreign_key: true

      t.timestamps(null: false)
    end
  end
end
