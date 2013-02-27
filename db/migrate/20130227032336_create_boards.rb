class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :category_id
      t.string :name
      t.string :description
    end
    add_index :boards, :category_id
    add_index :boards, :name, unique: true
  end
end
