class ChargesController < ApplicationController

  def new
    @event = Event.find(params[:event])
  end

  def create
    # Amount in cents
    @event = Event.find(params[:event_id])
    @amount = @event.price_in_cents

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Payment for #{@event.title}",
      :currency    => 'cad'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end