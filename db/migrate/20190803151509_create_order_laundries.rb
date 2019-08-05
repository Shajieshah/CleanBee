class CreateOrderLaundries < ActiveRecord::Migration[5.2]
    def change
      create_table :order_laundries do |t|
        t.integer :order_id
        t.integer :laundry_id
        t.float :cost
        t.string :notes

        t.timestamps
      end
    end

end
