module ReviewsHelper
  def star_rating(rate)
    full_stars = rate.to_i.clamp(0, 5) # Ensure rate is within 0-5 range
    empty_stars = 5 - full_stars

    ("".html_safe +
     ("<i class='fas fa-star'></i>" * full_stars).html_safe +
     ("<i class='far fa-star'></i>" * empty_stars).html_safe).html_safe
  end
end
