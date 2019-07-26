class CreateLaundries < ActiveRecord::Migration[5.2]
  def change
    create_table :laundries do |t|
    	t.string :name
    	t.float :delivery_cost
      t.timestamps
    end
  end
end
