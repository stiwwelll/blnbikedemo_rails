class Product < ActiveRecord::Base

  has_many :orders
  monetize :price
  has_many :comments

end
