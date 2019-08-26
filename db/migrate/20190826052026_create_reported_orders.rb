class CreateReportedOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :reported_orders do |t|
      t.integer :user_id
      t.integer :order_id
      t.string :reason
      t.string :notes

      t.timestamps
    end
  end
end
