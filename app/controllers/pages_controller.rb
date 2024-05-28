class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @danger_areas = DangerArea.all.limit(6)
  end

  def about
  end

  def contact
  end

  def terms
  end
end
