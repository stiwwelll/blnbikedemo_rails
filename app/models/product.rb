class Product < ActiveRecord::Base

  has_many :orders
  monetize :price

end
