class AddCostToCapabilities < ActiveRecord::Migration[5.2]
  def change
    add_column :capabilities, :cost, :float
  end
end
