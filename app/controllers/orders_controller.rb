class OrdersController < ApplicationController
  before_action :authenticate_user!


  def create
    order = Order.new
    beer = Beer.find(params[:beer_id])
    order.user_id = current_user.id
    order.beer = beer

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: beer.price_in_cents,
                                      description: beer.name)

    order.stripe_charge_id = charge.id

    order.save! #fail?
    beer.sell

    order_details = {
      email: current_user.email,
      order_number: order.id,
      beer_name: beer.name,
      beer_price: beer.price,
      user_name: current_user.profile.first_name
    }

    OrderMailer.send_order(order_details).deliver_now
    flash[:success] = "Cheers! You got an email with your order information! Your beer will be arriving soon!"
    redirect_to beer_path(beer)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to beer_path(beer)
  end
end
