class StaticPagesController < ApplicationController

  def landing_page
    @products = Product.limit(3)
  end

  def about
  end

  def contact
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    if Rails.env.production?
      UserMailer.contact_form(@email, @name, @message).deliver
    else
      ActionMailer::Base.mail(from: @email,
                              to: 'your-email@example.com',
                              subject: "A new contact form message from #{@name}",
                              body: @message).deliver_later
    end
  end

end
