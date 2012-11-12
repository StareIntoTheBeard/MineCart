class ProductCore < ActiveRecord::Base
  attr_accessible :active, :description, :image, :name, :price, :sku, :store_id
  belongs_to :store
end
