class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cities = City.all.limit(9)
  end
end
