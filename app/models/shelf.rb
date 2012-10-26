class Shelf < ActiveRecord::Base
  attr_accessible :currency, :description, :language, :name
  has_many :shelf_pages
  has_many :categories
end
