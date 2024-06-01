class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def index
    @cities = City.all
    if params[:query].present?
      sql_subquery = <<~SQL
        cities.name @@ :query
        OR cities.district @@ :query
        OR cities.state @@ :query
        OR cities.country @@ :query
      SQL
      @cities = @cities.where(sql_subquery, query: "%#{params[:query]}%")
    end

    @makers = @cities.geocoded.map do |city|
      {
        lat: city.latitude,
        lng: city.longitude
      }
    end
  end

  def show
    @city_reviews = Review.where(city_id: params[:id])
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
