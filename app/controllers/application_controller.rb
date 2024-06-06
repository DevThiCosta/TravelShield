class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :exempt_pages?

  private

  def exempt_pages?
    %w[about terms contact tips].include?(params[:action])
  end
end
