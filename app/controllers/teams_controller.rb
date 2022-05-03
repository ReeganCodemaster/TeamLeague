class TeamsController < ApplicationController
  before_action :set_team, only: %i[show edit update destroy] 

  def index
    @teams = Team.all
  end

  def show
    @games = Game.where(team_1_id:params[:id]).or(Game.where(team_2_id:params[:id]))
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(teams_params)
      
    if @team.save
      redirect_to @team
    else
      render :new , status: :unprocessable_entity
    end
  end

  def update
    if @team.update(teams_params)
      redirect_to @team
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Game.where(team_1_id:@team.id).or(Game.where(team_2_id:@team.id)).destroy_all
    @team.destroy
    redirect_to root_path, status: 303
  end

  private
  def set_team
    @team = Team.find(params[:id])
  end
  
  def teams_params
    params.require(:team).permit(:title, :coordinator, :password)
  end
end
