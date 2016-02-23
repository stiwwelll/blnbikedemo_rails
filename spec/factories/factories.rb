FactoryGirl.define do

sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
  	email			
		password		"12345678"
		first_name	"Hans"
		last_name		"Example"
		admin				false
	end

	factory :admin, class: User do
		email
		password		"12345678"
		first_name	"Admin"
		last_name		"User"	
		admin				true
	end

	factory :product do
	  name				"bike"
		description "best bike around"
	end

	factory :comment do
		user 				{ create(:user) }
	  product			{ create(:product) }
	  body 				"This is a bike"
	  rating			4
	end

end