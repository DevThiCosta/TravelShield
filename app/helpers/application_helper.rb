module ApplicationHelper
  include Pagy::Frontend

  def format_number_with_suffix(number)
    return "#{(number / 1_000_000.0).round(1)}M" if number >= 1_000_000
    return "#{(number / 1_000.0).round(1)}K" if number >= 1_000
    number.to_s
  end

end
