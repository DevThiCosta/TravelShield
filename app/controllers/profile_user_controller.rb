class ProfileUserController < ApplicationController
  def index
    @profile_users = User.all
  end

  def show
    @profile_user = User.find(params[:id])
  end

  def info
    @profile_user = User.find(params[:id])
  end

  private

  def profile_user_params
    params.require(:profile_user).permit(
      :name,
      :email,
      :password
    ) # Replace with the actual attributes of your ProfileUser model
  end
end
