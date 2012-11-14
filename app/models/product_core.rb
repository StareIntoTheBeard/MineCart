class ProductCore < ActiveRecord::Base
  attr_accessible :active, :description, :image, :name, :price, :sku, :store_id, :applytoall
  belongs_to :store
  has_many :product_instances
  validates :sku, :presence => true
  validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => true

end
