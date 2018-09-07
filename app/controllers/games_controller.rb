class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new; end

  def import
    Game.import(params[:file])
    redirect_to games_path, notice: 'File added successfully'
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def season_params
    params.require(:season).permit(:year)
  end
end
