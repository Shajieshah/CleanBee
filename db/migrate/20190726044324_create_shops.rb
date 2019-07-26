class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

    	t.integer :vendor_id
    	t.string :name
    	t.string :description
    	t.string :timings
    	t.float :latitude
      t.float :longitude
      t.boolean :active

      t.timestamps
    end
  end
end
