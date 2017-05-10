class OrderMailer < ApplicationMailer

  default from:'homebrewau@gmail.com'

  def send_order(order_information)
    @order = order_information
    mail(to: order_information[:email] ,
      subject:'New message from website') do |format|
        format.text { render 'order_details' }
    end
  end
end
