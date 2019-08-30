class AddShopidOrderidToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :shop_id, :integer
    add_column :notifications, :order_id, :integer
    add_column :notifications, :assignee_id, :integer
    rename_column :notifications, :user_id, :owner_id
  end
end
