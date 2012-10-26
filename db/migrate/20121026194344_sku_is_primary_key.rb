class SkuIsPrimaryKey < ActiveRecord::Migration
  def change
  	add_index :product_cores, :sku, unique: true
  end
end
