class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.string :user_id1
      t.string :user_id2

      t.timestamps
    end
  end
end
