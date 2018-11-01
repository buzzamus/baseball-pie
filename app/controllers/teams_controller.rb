class TeamsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :find_first_season, only: [:show]
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
    @games = Game.all
    @home_games = @games.where(home_team: "#{@team.sheet_key}")
    @away_games = @games.where(away_team: "#{@team.sheet_key}")
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to team_path(@team)
    else
      render 'edit'
      puts @team.errors.messages
    end
  end

  private

  def team_params
    params.require(:team).permit(:league, :city, :park, :sheet_key)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
