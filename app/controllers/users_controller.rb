class UsersController < ApplicationController
  def dashboard

    @my_own_plants = Plant.where(user_id: current_user.id)
    @my_bookings = Booking.where(user_id: current_user.id)

  end
end
