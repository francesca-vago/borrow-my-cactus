class PlantsController < ApplicationController
  def index
    if params[:query].present?
      @plants = policy_scope(Plant).global_search(params[:query])
    else
      @plants = policy_scope(Plant)
    end
    @markers = @plants.map do |plant|
      {
        lat: plant.latitude,
        lng: plant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { plant: plant })
      }
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @booking = Booking.new
    authorize @plant
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
    authorize @plant
    if @plant.update(plant_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    authorize @plant
    @plant.destroy
    redirect_to dashboard_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :species, :instructions, :daily_price, :image, :danger_level)
  end
end
