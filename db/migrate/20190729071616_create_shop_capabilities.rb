class CreateShopCapabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_capabilities do |t|
    	
      t.references :capability, foreign_key: true
      t.references :shops, foreign_key: true

      t.timestamps
    end
  end
end
