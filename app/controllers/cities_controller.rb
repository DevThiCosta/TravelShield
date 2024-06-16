class CitiesController < ApplicationController

  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @pagy, @cities = pagy(City.search_any_location(params[:query]), items: 8)
    else
      @pagy, @cities = pagy(City.all, items: 8)
    end
  end

  def show
    @city_reviews = Review.where(city_id: params[:id])
    @city = City.find(params[:id])
    @danger_areas = @city.danger_areas
    @danger_markers = @danger_areas.geocoded.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude
      }
    end

    @markers = [{
      lat: @city.latitude,
      lng: @city.longitude
    }]
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_url, notice: 'City was successfully destroyed.'
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :country, :population)
  end
end
