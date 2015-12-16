require 'rails_helper'

describe Comment do
  before do
    @product = Product.create!(name: "race bike", description: "best bike there is")
    @user = User.create!(email: "marco@test.de", password: "123123123")
    @comment = Comment.create!(body: "great bike", user: @user, product: @product, rating: 5)
  end
  it "Comment parameters have been included" do
    expect(@comment).to be_valid
  end
end

describe Comment do
  before do
    @product = Product.create!(name: "race bike", description: "best bike there is")
    @user = User.create!(email: "marco@test.de", password: "123123123")
    @comment = Comment.create!(body: "fuck that bike", user: @user, product: @product, rating: 1)
  end
  it "Including rude language" do
    expect(@comment.clean_language).to_not be_valid
  end
end
