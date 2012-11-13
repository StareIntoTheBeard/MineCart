class Category < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :shelf
  has_many :product_instances

  def parent
  	shelf
  end

end
