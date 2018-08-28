class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def import
    #@season = Season.new(season_params)
    Game.import(params[:file])
    redirect_to games_path, notice: "File added successfully"
  end

  def season_params
    params.require(:season)
  end
end
