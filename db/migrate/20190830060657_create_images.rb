class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :imageable_name
      # t.integer :imageable_id
      t.references :imageable, polymorphic: true
      # t.string :imageable_type
      t.integer :imageable_size
      t.string :imageable_content_type

      t.timestamps
    end
  end
end
