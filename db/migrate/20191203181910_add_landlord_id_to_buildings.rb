class AddLandlordIdToBuildings < ActiveRecord::Migration[6.0]
  def change
    add_column :buildings, :landlord_id, :integer
  end
end
