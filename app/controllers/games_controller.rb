class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  before_action :set_team

  def index
    @games = Game.all
    @points = Hash.new()
    @games.each do |game|
      point_service = PointsService.new(game.team_1_id, game.team_2_id) 
      points_hash = point_service.call()
      @points.merge!(points_hash) 
    end
  end

  def new
    @game = Game.new()
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @team
    else 
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @game.update(game_params)
      redirect_to @team
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
    
    redirect_to team_games_path(@team)
  end

  private
  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:team_1_id , :team_2_id, :team_1_score, :team_2_score)
  end
end
