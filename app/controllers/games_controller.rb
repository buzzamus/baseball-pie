class GamesController < ApplicationController

  def index
    @games = Game.all
    #need to find a way to take argument to allow sorting by year
    @games.each do |game|
      if game.year != "2016"
        game.delete
      end
    end
    #@games = @games.select { |game| game.year = "201" }
  end

  def new
  end

  def import
    Game.import(params[:file])
    redirect_to games_path, notice: "File added successfully"
  end

  def season_params
    params.require(:season)
  end
end
