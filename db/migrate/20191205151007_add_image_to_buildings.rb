class AddImageToBuildings < ActiveRecord::Migration[6.0]
  def change
    add_column :buildings, :image, :string
  end
end
