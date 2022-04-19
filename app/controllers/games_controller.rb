class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update]
  before_action :set_team

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
    
    @game = Game.find(params[:id])
    @game.delete
    
    redirect_to @team
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
