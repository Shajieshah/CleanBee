class CreateShopServiceCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_service_charges do |t|

    	t.integer :shop_id
    	t.integer :laundry_id
    	t.integer :capability_id

      t.timestamps
    end
  end
end
