require 'rails_helper'

describe Product do
  before do
    @product = Product.create!(name: "race bike")
    @user = User.create!(email: "marco@test.de", password: "123123123")
    @product.comments.create!(rating: 1, user: @user, body: "Horrible bike!")
    @product.comments.create!(rating: 3, user: @user, body: "Alright!")
    @product.comments.create!(rating: 5, user: @user, body: "Spitze!")
  end
  it "returns the average rating of all comments" do
    expect(@product.average_rating).to eq 3
  end
end

describe Product do
  context "Product name and description present" do
    before do
    @product = Product.create!(name: "race bike", description: "The best bike arround")
    end
    it "Product name and description are included" do
      expect(@product).to be_valid
    end
  end
  context "Product name present" do
    before do
    @product = Product.create!(name: "race bike")
    end
    it "Product name is included" do
      expect(@product).to be_valid
    end
  end
  context "Product name present" do
    before do
    @product = Product.create!(description: "The best bike arround")
    end
    it "Description is included" do
      expect(@product).to_not be_valid
    end
  end
end
