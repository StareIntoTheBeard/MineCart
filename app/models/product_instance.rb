class ProductInstance < ActiveRecord::Base
  attr_accessible :active, :description, :image, :price, :category_id
  belongs_to :category
end
