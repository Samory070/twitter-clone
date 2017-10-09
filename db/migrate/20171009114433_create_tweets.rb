class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :content :varchar(40)
      t.string :user_id

      t.timestamps
    end
  end
end
