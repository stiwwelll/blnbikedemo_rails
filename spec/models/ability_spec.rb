require 'rails_helper'
require 'cancan/matchers'

describe Ability do
  context "User abilities" do
    before do
      @user = FactoryGirl.build(:user)
      @ability = Ability.new(@user)
    end

    it "A user can create and read comments" do
      expect(@ability).to be_able_to(:read, Comment.new)
      expect(@ability).to be_able_to(:create, Comment.new)
    end

    it "A user can only edit and destroy own comments" do
      expect(@ability).to be_able_to(:edit, Comment.new(user: @user))
      expect(@ability).to be_able_to(:destroy, Comment.new(user: @user))
    end

    it "A user can manage own user" do
      expect(@ability).to be_able_to(:manage, User.new)
    end

  end

  context "Admin abilities" do
    before do
      @user = FactoryGirl.build(:admin)
      @ability = Ability.new(@user)
    end

    it "An can manage comments" do
      expect(@ability).to be_able_to(:manage, Comment)

    end
  end

end
