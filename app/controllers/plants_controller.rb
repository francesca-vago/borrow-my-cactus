class PlantsController < ApplicationController
  def index
    @plants = policy_scope(Plant.all)
  end

  def show
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def search
    @plant = Plant.new
    @plants = Plant.geocoded
    @markers = @plants.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { plant: plant })
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
      redirect_to dashboard_path
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
    if @plant.update
      redirect_to dashboard_path
    else
      render :edit
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_path
    authorize @plant
  end


  private

  def plant_params
    params.require(:plant).permit(:name, :species, :instructions, :daily_price, :image, :danger_level)
  end
end
