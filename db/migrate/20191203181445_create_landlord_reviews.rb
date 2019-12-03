class CreateLandlordReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :landlord_reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.boolean :hotness
      t.integer :tenant_id
      t.integer :landlord_id

      t.timestamps
    end
  end
end
