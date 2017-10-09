class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets |t| do
    t.string :message null:false,limit:140
    t.string :user_id

    t.timestamps
  end
end
