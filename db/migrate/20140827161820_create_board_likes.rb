class CreateBoardLikes < ActiveRecord::Migration
  def change
    create_table :board_likes do |t|
      t.integer :user_id, null: false
      t.integer :board_id, null: false

      t.timestamps
    end

    add_index :board_likes, [:user_id, :board_id], unique: true
  end
end
