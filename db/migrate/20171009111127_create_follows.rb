class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.reference :follower, null: false, foreign_key: true
      t.reference :followee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
