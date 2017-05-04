class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :amount_to_be_charged
  before_action :description

  def new
  end


  def create
    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: @description)
    redirect_to thanks_path
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_path
  end

  def thanks
  end

  private

  def description
    @description = "Some amazing product"
  end

  def amount_to_be_charged
    @amount = 1000
  end

end