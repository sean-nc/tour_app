class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:new, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @bookings = @event.bookings.all
    @number_of_guests = 0
    @bookings.each do |b|
      @number_of_guests += b.number_of_guests.to_i
    end
    @open_spots = @event.max_bookings - @number_of_guests
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
  @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event deleted"
    redirect_to events_path
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :when, :duration ,:details,
                                    :max_bookings, :price, :creator_id)
    end
end
