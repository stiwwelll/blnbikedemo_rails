require 'rails_helper'

describe CommentsController, type: :controller do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe "POST create" do
    context "with valid attributes" do
      before do
        sign_in @user
      end

      it 'creates a new comment with valid attributes' do
        comment_attr = attributes_for(:comment)
        product = Product.last || create(:product)

        expect{
          post :create, comment: comment_attr, product_id: product.id
        }.to change(Comment,:count).by(1)
      end
    end
  end
end
