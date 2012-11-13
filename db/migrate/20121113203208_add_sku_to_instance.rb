class AddSkuToInstance < ActiveRecord::Migration
  def change
  	add_column :product_instances, :sku, :string
  end
end
