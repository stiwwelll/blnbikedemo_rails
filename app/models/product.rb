class Product < ActiveRecord::Base

  has_many :orders
  has_many :comments

  monetize :price

  def average_rating
    comments.average(:rating).to_f
  end

  validates :name, presence: true

end
