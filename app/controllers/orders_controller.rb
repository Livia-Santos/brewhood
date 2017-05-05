class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :description

  def new
  end


  def create
    @order = Order.create(params[:order])
    @order.user_id = current_user.id
    # user Id has many beers
    # I have to know in wich beer I am to pass to the databe
    # Struggling point Understand who can I pass the Beer_id(find)


    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: @description)

    # Stripe card is going to the db.
    @order.stripe_charge_id = charge.id

    if @order.save
      redirect_to thanks_path
    else
      render 'new'
    end

    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end

  def thanks
  end

  def order_params
  end

  private

  def description
    @description = "Some amazing product"
  end

  def amount_to_be_charged
    @amount = 1000
  end

end
