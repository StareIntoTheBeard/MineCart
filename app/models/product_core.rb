class ProductCore < ActiveRecord::Base
  attr_accessible :active, :description, :image, :name, :price, :sku
  belongs_to :store
end
