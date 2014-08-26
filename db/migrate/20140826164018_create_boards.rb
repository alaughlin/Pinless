class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :user_id, null: false
      t.boolean :public, null: false
      t.string :title, null: false
      t.string :img_url
      t.text :description

      t.timestamps
    end

    add_index :boards, :user_id
    add_index :boards, :title
    add_index :boards, :description
  end
end
