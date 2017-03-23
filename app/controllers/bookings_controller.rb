class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = current_user.bookings.create(booking_params.merge(room_id: params[:room_id]))
    @booking.set_total_price
    @booking.save
    redirect_to @booking.room, notice: "Thank you for booking!"
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end
end
