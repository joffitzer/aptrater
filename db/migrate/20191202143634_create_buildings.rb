class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :address
      t.string :neighborhood
      t.text :description
      t.integer :apt_count

      t.timestamps
    end
  end
end
