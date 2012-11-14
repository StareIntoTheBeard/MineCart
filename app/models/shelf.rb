require 'parent_resource'
class Shelf < ActiveRecord::Base
  attr_accessible :currency, :description, :language, :name, :store_id	
  belongs_to :store
  parent_resource :store
  has_many :shelf_pages
  has_many :categories

end
