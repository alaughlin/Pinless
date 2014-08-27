class AddImageToCard < ActiveRecord::Migration
  def self.up
    add_attachment :cards, :image
    remove_column :cards, :img_url
  end

  def self.down
    remove_attachment :cards, :image
    add_column :cards, :img_url, :string
  end
end
