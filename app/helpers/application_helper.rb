module ApplicationHelper
include Pagy::Frontend

  def format_number_with_suffix(number)
    return "#{(number / 1_000_000.0).round(1)}M" if number >= 1_000_000
    return "#{(number / 1_000.0).round(1)}K" if number >= 1_000
    number.to_s
  end

  def star_rating(rate)
    full_star = '<i class="fas fa-star text-warning"></i>'
    empty_star = '<i class="far fa-star text-muted"></i>'
    (full_star * rate + empty_star * (5 - rate)).html_safe
  end
end
