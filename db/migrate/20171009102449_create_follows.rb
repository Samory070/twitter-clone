class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :person_following_id
      t.integer :person_followed_id
      t.timestamps
    end
  end
end
