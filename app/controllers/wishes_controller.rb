class WishesController < ApplicationController
  def show
    @wish = Wish.find(params[:id])
    authorize @wish
  end

  def create
    @wish = Wish.new(plant_id: params[:plant_id], user_id: current_user)
    @wish.user = current_user
    @wish.save
    authorize @wish
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy
    authorize @wish
    redirect_to dashboard_path
  end
end
