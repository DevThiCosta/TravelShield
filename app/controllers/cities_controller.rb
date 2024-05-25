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
  params.require(:city).permit(:name)
end
