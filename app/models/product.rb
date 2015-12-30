class Product < ActiveRecord::Base

  has_many :orders
  has_many :comments

  monetize :price_cents

  def average_rating
    comments.average(:rating).to_f
  end

  validates :name, presence: true

end
