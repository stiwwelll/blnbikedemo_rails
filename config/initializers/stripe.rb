if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key  => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key       => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ENV['pk_test_PmurlnIBtVc2OkwJ7GvSfniL'],
    :secret_key => ENV['sk_test_12mHOU42HGljZQZblmqyBMsK']
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
