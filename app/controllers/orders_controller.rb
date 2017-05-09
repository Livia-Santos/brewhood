class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.new
    @beer = Beer.find(params[:beer_id])
    @order.user_id = current_user.id
    @order.beer = @beer

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @beer.price_in_cents,
                                      description: @beer.name)

    # Stripe card is going to the db.
    @order.stripe_charge_id = charge.id

    @order.save!
    flash[:success] = "Cheers! Your beer will be arriving soon!"
    redirect_to beer_path(@beer)


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to beer_path(@beer)
  end
end
