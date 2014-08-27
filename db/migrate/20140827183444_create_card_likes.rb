class CreateCardLikes < ActiveRecord::Migration
  def change
    create_table :card_likes do |t|
      t.integer :card_id
      t.integer :user_id

      t.timestamps
    end

    add_index :card_likes, [:card_id, :user_id], unique: true
  end
end
