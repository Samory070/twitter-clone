class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweet do |t|
      t.string :body, null: false
      t.reference :users, null: false, foreign_key: true

      t.timestamp
    end
  end
end
