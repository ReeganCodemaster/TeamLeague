class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  def index
    point_service = PointsService.new()
    @points = point_service.call()
  end

  def new
    @game = Game.new(team_1_id:params[:team_id])
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
      redirect_to @team
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path(@game)
  end

  def tournament

    point_service = PointsService.new() 

    @match_ups =  {} 
    @team_num = params[:team_num] 
    if @team_num != nil  
      k = 0
      prev_team = ''
      @points.each do |team|
        k += 1  
        if k <= @team_num.to_i
          if k % 2 == 0
            @match_ups[prev_team] = team[0]
          else
            prev_team = team[0]
          end
        end
      end 
    end
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:team_1_id , :team_2_id, :team_1_score, :team_2_score)
  end
end
