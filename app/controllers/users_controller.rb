class UsersController < ApplicationController
  def dashboard
    @my_own_plants = current_user.plants
    # @my_own_plants = Plant.where(user: current_user)
    @my_bookings = current_user.bookings
    @my_wishes = current_user.wishes
  end
end

