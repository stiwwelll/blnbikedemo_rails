class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  layout 'mailer'

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
            :to => 'marco.steffensky@gmail.com',
            :subject => "A new contact form message from #{name}")
  end
end
