class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @cities = City.all.limit(9)
  end

  def about
  end

  def contact
  end

  def terms
  end

  def tips
  end

  def plans
  end
end
