class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

    	t.integer :user_id
    	t.integer :shop_id
    	t.string :order_type
      t.string :pick_location
      t.string :pickup_time
      t.string :pickup_date
      t.string :delivery_time
      t.string :delivery_date
      t.string :status, default: "pending"
      t.float :cost
      t.string :pick_lat_lng
      t.string :drop_lat_lng

      t.timestamps
    end
  end
end
