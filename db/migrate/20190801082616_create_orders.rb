class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

    	t.integer :owner_id
    	t.integer :assignee_id
    	t.integer :shop_id
    	t.string :order_type
      t.string :pick_location
      t.string :pickup_time
      t.string :pickup_date
      t.string :delivery_time
      t.string :delivery_date
      t.string :status, default: "open"
      t.float :cost
      t.float :pick_lat
      t.float :pick_lng
      t.float :shop_lat
      t.float :shop_lng

      t.timestamps
    end
  end
end
