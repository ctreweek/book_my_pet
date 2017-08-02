class BookingsController < ApplicationController
  def new
    if user_signed_in?
      @booking = Booking.new
      @dog = Dog.find(params[:dog_id])
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @dog = Dog.find(params[:dog_id])
    @booking.dog = @dog
    @booking.user = current_user

    if @booking.save
      redirect_to pages_dashboard_path
    else
      render:new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
