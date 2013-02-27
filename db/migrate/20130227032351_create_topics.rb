class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :board_id
      t.string :title
      t.text :content
      t.integer :views, default: 0

      t.timestamps
    end
    add_index :topics, :user_id
    add_index :topics, :board_id
    add_index :topics, :views
  end
end
