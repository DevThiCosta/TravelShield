class CitiesController < ApplicationController
  def index
    @city = Cities.all
  end

  def show
    @city = Cities.find(params[:id])
  end
end

private

def city_params
  params.require(:city).permit(:name, :district, :state, :country, :safety_tip)
end
