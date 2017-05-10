class OrderMailer < ApplicationMailer

  default from:'homebrewau@gmail.com'

  def send_order(email, message)
    @email = email
    @message = message

    mail(to:'mailgun@authorizedrecipient.com',
      subject:'New message from website') do |format|
        format.html { render 'order_mailer' }
        format.text { render 'order_mailer' }
      end
  end

end
