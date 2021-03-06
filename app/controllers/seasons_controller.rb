class SeasonsController < ApplicationController
  before_action :require_user, only: [:new, :created]
  def index
    @seasons = Season.all
  end

  def new
    @season = Season.new
    @games = Game.all
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to seasons_path
    else
      render 'new'
    end
  end

  def show
    @season = Season.find(params[:id])
    @games = Game.where(game_year: "#{@season.year}")
  end

  private

  def season_params
    params.require(:season).permit(:year)
  end
end
