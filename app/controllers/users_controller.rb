class UsersController < ApplicationController
  def dashboard
    @my_own_plants = Plant.where(user_id: current_user.id)
    @my_booking_plant_id = Booking.where(user_id: current_user.id)

    @plant_borrowed = Plant.where(id: @my_booking_plant_id)

  end
end
