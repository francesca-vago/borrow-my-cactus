class UsersController < ApplicationController
  def dashboard
    @my_own_plants = current_user.plants
    # @my_own_plants = Plant.where(user: current_user)
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @my_wishes = current_user.wishes
    authorize @my_own_plants
    authorize @bookings
    authorize @my_wishes
  end
end

