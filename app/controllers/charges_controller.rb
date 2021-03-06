class ChargesController < ApplicationController
  before_action :open_spots, only: :new

  def new
    @event = Event.find(params[:event])
    @booking = Booking.new(event_id: @event.id,
                           first_name: params[:first_name],
                           last_name: params[:last_name],
                           number_of_guests: params[:number_of_guests])
    @amount = @event.price * @booking.number_of_guests
  end

  def create
    user_email = params[:stripeEmail]
    @booking = Booking.create(event_id: params[:event_id],
                              first_name: params[:first_name],
                              last_name: params[:last_name],
                              number_of_guests: params[:number_of_guests],
                              email: user_email)
    @amount = params[:amount]

    customer = Stripe::Customer.create(
      :email => user_email,
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Payment for #{@booking.first_name} #{@booking.last_name} - #{@booking.number_of_guests} tickets.",
      :currency    => 'cad'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
  end

  private
    def open_spots
      unless params[:open_spots].to_i > params[:number_of_guests].to_i
      flash[:notice] = "Sorry, you tried to purchase #{params[:number_of_guests]}
                        tickets and there are only #{params[:open_spots]} tickets left."
      redirect_to event_path(params[:event])
    end
end