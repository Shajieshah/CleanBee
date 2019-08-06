class CreateFavouriteShops < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_shops do |t|

    	t.integer :user_id
    	t.integer :shop_id
    	
      t.timestamps
    end
  end
end
