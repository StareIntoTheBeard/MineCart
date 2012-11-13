class ProductInstance < ActiveRecord::Base
  attr_accessible :active, :description, :image, :price, :category_id, :sku
  belongs_to :category
  belongs_to :product_core
end
