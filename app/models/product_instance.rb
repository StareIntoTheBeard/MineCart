class ProductInstance < ActiveRecord::Base
  attr_accessible :active, :description, :image, :price
  belongs_to :category
end
