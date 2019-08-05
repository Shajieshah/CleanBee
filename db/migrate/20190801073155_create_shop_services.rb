class CreateShopServices < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_services do |t|

    	t.integer :shop_id
    	t.integer :laundry_id
    	t.integer :capability_id
    	t.float :cost

      t.timestamps
    end
  end
end
