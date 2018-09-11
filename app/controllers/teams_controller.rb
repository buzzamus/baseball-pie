class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def show
    @team = Team.find(params[:id])
    @games = Game.all
    @home_games = @games.where(home_team: "#{@team.sheet_key}")
    @away_games = @games.where(away_team: "#{@team.sheet_key}")
  end

  private

  def team_params
    params.require(:team).permit(:league, :city, :park, :sheet_key)
  end
end
