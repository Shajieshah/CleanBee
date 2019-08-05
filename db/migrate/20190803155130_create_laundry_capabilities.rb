class CreateLaundryCapabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :laundry_capabilities do |t|
      t.integer :laundry_id
      t.integer :capability_id

      t.timestamps
    end
  end
end
