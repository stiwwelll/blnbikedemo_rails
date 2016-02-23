require 'rails_helper'

describe User, type: :model do
	it "should not be valid without an email address" do
		@user = FactoryGirl.build(:user, email: "not_an_ email")
		expect(@user).to_not be_valid
	end
end


