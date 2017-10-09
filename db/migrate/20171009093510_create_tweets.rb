class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamp
    end
  end
end
