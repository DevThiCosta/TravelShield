class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  require 'pagy/extras/bootstrap'
  include Pagy::Backend

  def index
    @pagy, @reviews = pagy(Review.all, items: 12)
    @filtered_reviews = params[:rating].present? ? @reviews.select { |review| review.rate == params[:rating].to_i } : @reviews
  end

  def show
    @user_reviews = Review.where(user_id: params[:id])
  end

  def show_info
    @review = Review.find(params[:id])
  end

  def user_reviews
    @user = User.find(params[:id])
    @pagy, @reviews = pagy(@user.reviews, items: 10)
  end

  def new
    @pagy, @reviews = pagy(Review.all, items: 12)
  end

  def create
    @review = current_user.reviews.new(review_params)
    if @review.save
      redirect_to @review, notice: 'Review successfully created.'
    else
      Rails.logger.info(@review.errors.full_messages)  # Log errors
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :comment, :rate, :city_id)
  end
end
