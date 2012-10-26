class ShelfPage < ActiveRecord::Base
  attr_accessible :content, :tags, :title
  belongs_to :shelf
end
