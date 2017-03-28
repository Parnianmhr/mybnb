class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update]
    before_action :authenticate_user!, except: [:show]

    def index
        @booking = current_user.bookings
    end

    # def show
    #     @booking = current_user.bookings
    # end

    def create
        @booking = current_user.bookings.create(booking_params)
        @booking.room_id = params[:room_id]
        if @booking.room_available?
            @booking.set_total_price
            @booking.save
            redirect_to @booking.room, notice: 'Thank you for booking! You can find your bookings in Bookings page.'
        else
            redirect_to @booking.room, notice: 'Sorry! This listing is not available during the dates you requested.'
        end
    end

    private

    def booking_params
        params.require(:booking).permit(:starts_at, :ends_at)
    end

    def set_booking
        @booking = Booking.find(params[:id])
    end
end
