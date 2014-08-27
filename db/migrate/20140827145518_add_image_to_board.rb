class AddImageToBoard < ActiveRecord::Migration
  def self.up
    add_attachment :boards, :avatar
    remove_column :boards, :img_url
  end

  def self.down
    remove_attachment :boards, :avatar
    add_column :boards, :img_url, :string
  end
end
