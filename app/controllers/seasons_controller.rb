class SeasonsController < ApplicationController
  def index
    @seasons = Season.all
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new(season_params)
  end

  private

  def season_params
    params.require(:season).permit(:year)
  end
end
