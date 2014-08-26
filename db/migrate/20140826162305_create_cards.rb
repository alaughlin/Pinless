class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false
      t.integer :board_id, null: false
      t.string :title, null: false
      t.text :description
      t.string :img_url, null: false

      t.timestamps
    end

    add_index :cards, :user_id
    add_index :cards, :board_id
    add_index :cards, :title
    add_index :cards, :description
  end
end
