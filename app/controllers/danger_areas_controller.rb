class DangerAreasController < ApplicationController
  def index
    @danger_areas = DangerArea.all
  end
end
