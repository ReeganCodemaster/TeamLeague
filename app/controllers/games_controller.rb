class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  def index
    @games = Game.all
    @points = Hash.new()

    @games.each do |game|
      point_service = PointsService.new(game.team_1_id, game.team_2_id) 
      points_hash = point_service.call()

      if points_hash[game.team_1_id] > 0 and points_hash[game.team_2_id] > 0
        @points.merge!(points_hash) 
      elsif points_hash[game.team_1_id] > 0 and points_hash[game.team_2_id] = 0
        @points[game.team_1_id] = points_hash[game.team_1_id]
        @points[game.team_2_id] = @points[game.team_2_id].to_i + points_hash[game.team_2_id]
      elsif points_hash[game.team_1_id] = 0 and points_hash[game.team_2_id] > 0
        @points[game.team_2_id] = points_hash[game.team_2_id]
        @points[game.team_1_id] = @points[game.team_1_id].to_i + points_hash[game.team_1_id]
      end
    end 
    @points = @points.sort_by{|key, value| value}.reverse
  end

  def new
    @game = Game.new()
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game.team_1
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @team = request.referer
  end

  def update
    if @game.update(game_params)
     @team_id = params[:id]
      redirect_to @team
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path(@game)
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:team_1_id , :team_2_id, :team_1_score, :team_2_score)
  end
end
