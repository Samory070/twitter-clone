class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :body, limit: 140, null: false

      t.timestamps
    end
  end
end
