class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :topic_id
      t.text :content

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :topic_id
    add_index :comments, [:user_id, :topic_id]
  end
end
