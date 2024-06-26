class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!, unless: :exempt_pages?

  private

  def exempt_pages?
    %w[about terms contact tips prices].include?(params[:action])
  end
end
