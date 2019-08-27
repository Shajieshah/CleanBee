class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :order_id
      t.integer :shop_id
      t.string :title
      t.text :message

      t.timestamps
    end
  end
end
