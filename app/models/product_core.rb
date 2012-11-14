class ProductCore < ActiveRecord::Base
  attr_accessible :active, :description, :image, :name, :price, :sku, :store_id, :applytoall
  belongs_to :store
  has_many :product_instances

  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than_or_equal_to => 0.01}
end
