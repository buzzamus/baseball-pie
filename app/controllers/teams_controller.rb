class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
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
    @first_season = find_first_season
    @games = Game.all
    @home_games = @games.where(home_team: "#{@team.sheet_key}")
    @away_games = @games.where(away_team: "#{@team.sheet_key}")
    @team_runs = @games.where(home_team: "#{@team.sheet_key}").sum(:home_score).to_i + @games.where(away_team: "#{@team.sheet_key}").sum(:away_score).to_i
    @runs_against = @games.where(home_team: "#{@team.sheet_key}").sum(:away_score).to_i + @games.where(away_team: "#{@team.sheet_key}").sum(:home_score).to_i
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render 'edit'
    end
  end

  private

  def team_params
    params.require(:team).permit(:league, :city, :park, :sheet_key)
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def find_first_season
    seasons = Season.all
    first_year = seasons.min_by(&:year).year
  end
end
