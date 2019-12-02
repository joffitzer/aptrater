class CreateBuildingReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :building_reviews do |t|
      t.string :title
      t.text :content
      t.integer :cleanliness
      t.integer :super
      t.integer :noise
      t.boolean :renew
      t.integer :tenant_id
      t.integer :building_id

      t.timestamps
    end
  end
end
