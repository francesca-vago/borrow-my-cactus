class PlantsController < ApplicationController
  def index
    @plants = policy_scope(Plant.all)
  end

  def show
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def search
    @plants = Plant.geocoded
    @markers = @plants.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
    authorize @plants
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    authorize @plant
    if @plant.save
      redirect_to plants_path
    else
      render 'new'
    end
  end

  def edit
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    authorize @plant
      redirect_to plants_path
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.delete
    redirect_to plants_path
    authorize @plant
  end


  private

  def plant_params
    params.require(:plant).permit(:name, :species, :instructions, :daily_price, :image, :danger_level)
  end
end
