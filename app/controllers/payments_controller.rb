class PaymentsController < ApplicationController

before_filter :authenticate_user!
# POST /payments
# POST /payments.json
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :customer => @user,
        :amount => @product.price_cents, # amount in cents, again
        :currency => "eur",
        :source => token,
        :description => @product.description
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user, total: @product.price)
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

  end

end
