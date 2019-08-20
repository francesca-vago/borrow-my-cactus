class WishesController < ApplicationController
  def create
    @wish = Wish.new(plant_id: params[:plant_id], user_id: current_user)
    @wish.user = current_use
    @wish.save
    authorize @wish
  end
end
