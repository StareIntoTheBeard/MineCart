class ProductInstance < ActiveRecord::Base
  attr_accessible :active, :description, :image, :price, :category_id, :sku
  belongs_to :category
  belongs_to :product_core

  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than_or_equal_to => 0.01}
end
