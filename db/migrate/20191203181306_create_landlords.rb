class CreateLandlords < ActiveRecord::Migration[6.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :nickname
      t.string :avatar

      t.timestamps
    end
  end
end
