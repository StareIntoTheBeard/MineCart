class ApplyToAllProductcoreChanges < ActiveRecord::Migration
  def change
  	add_column :product_cores, :applytoall, :boolean, :default => false
  end
end
