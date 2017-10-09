class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :post, :limit => 140, :null => false
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
