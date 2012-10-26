class CreateProductInstances < ActiveRecord::Migration
  def change
    create_table :product_instances do |t|
      t.text :description
      t.string :image
      t.boolean :active
      t.integer :price

      t.timestamps
    end
  end
end
