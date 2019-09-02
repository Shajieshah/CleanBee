class CreateCapabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :capabilities do |t|
      t.string :name
      t.integer :laundry_id
      t.timestamps
    end
  end
end
