class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

    	t.integer :vendor_id
    	t.string :name
    	t.string :description
    	t.string :timings
    	t.float :latitude
      t.float :longitude
      t.string :address
      t.float :rating, default: 5.0
      t.attachment :image
      t.boolean :online, default: false

      t.timestamps
    end
  end
end