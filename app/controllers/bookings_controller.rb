class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = current_user.bookings.create(booking_params)
    @booking.room_id = params[:room_id]
    if @booking.room_available?
      @booking.set_total_price
      @booking.save
      redirect_to @booking.room, notice: "Thank you for booking!"
    else
      redirect_to @boking.room, notice: "Sorry! This listing is not available during the dates you requested."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
