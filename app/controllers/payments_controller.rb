class PaymentsController < ApplicationController

# POST /payments
# POST /payments.json
  def create
    @product = Product.find(params[:product_id])
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: @product.price_cents, # amount in cents, again
        currency: "eur",
        source: token,
        description: token
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: current_user,total: @product.price)
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

  end

end
