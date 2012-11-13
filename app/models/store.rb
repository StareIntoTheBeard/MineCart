class Store < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :product_cores
  has_many :shelves
end
