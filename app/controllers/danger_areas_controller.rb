class DangerAreasController < ApplicationController
  def index
    @danger_areas = DangerArea.all
  end

  def show
    @danger_area = DangerArea.find(params[:id])
  end

  def new
    @danger_area = DangerArea.new
  end

  def create
    @danger_area = DangerArea.new(danger_area_params)
    if @danger_area.save
      redirect_to danger_area_path(@danger_area)
    else
      render :new
    end
  end

  def edit
    @danger_area = DangerArea.find(params[:id])
  end

  def update
    @danger_area = DangerArea.find(params[:id])
    if @danger_area.update(danger_area_params)
      redirect_to danger_area_path(@danger_area)
    else
      render :edit
    end
  end

  def destroy
    @danger_area = DangerArea.find(params[:id])
    @danger_area.destroy
    redirect_to danger_areas_path
  end

  private

  def danger_area_params
    params.require(:danger_area).permit(:name, :description)
  end
end
