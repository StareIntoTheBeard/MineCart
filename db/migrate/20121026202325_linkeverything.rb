class Linkeverything < ActiveRecord::Migration
  def change
  	add_column :product_cores, :store_id, :integer
  	add_column :shelf_pages, :shelf_id, :integer
  	add_column :shelves, :store_id, :integer
  	add_column :categories, :shelf_id, :integer
  	add_column :product_instances, :product_core_id, :integer
  	add_column :product_instances, :category_id, :integer
  end
end
