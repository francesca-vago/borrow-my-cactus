class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = User.first
    if @plant.save
      redirect_to plants_path
    else
      render 'new'
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
      redirect_to plants_path
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.delete
  end


  private

  def plant_params
    params.require(:plant).permit(:name, :species, :instructions, :daily_price, :image, :danger_level)
  end
end
