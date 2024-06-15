class SightsController < ApplicationController
  before_action :set_sight, only: [:show, :edit, :update, :destroy]

  def index
    @sights = Sight.all
  end

  def show
  end

  def new
    @sight = Sight.new
  end

  def create
    @sight = Sight.new(sight_params)
    if @sight.save
      flash[:success] = 'Ponto turístico criado com sucesso!'
      redirect_to @sight
    else
      flash.now[:error] = 'Erro ao criar ponto turístico.'
      render :new
    end
  end

  def edit
  end

  def update
    if @sight.update(sight_params)
      flash[:success] = 'Ponto turístico atualizado com sucesso!'
      redirect_to @sight
    else
      flash.now[:error] = 'Erro ao atualizar ponto turístico.'
      render :edit
    end
  end

  def destroy
    @sight.destroy
    flash[:success] = 'Ponto turístico excluído com sucesso!'
    redirect_to sights_path
  end

  private

  def set_sight
    @sight = Sight.find(params[:id])
  end

  def sight_params
    params.require(:sight).permit(:name, :description, :location, :photo)
  end
end
