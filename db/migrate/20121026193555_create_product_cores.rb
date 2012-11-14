class CreateProductCores < ActiveRecord::Migration
  def change
    create_table :product_cores do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.decimal :price, :precision => 8, :scale => 2
      t.string :sku
      t.string :image

      t.timestamps
    end
  end
end
