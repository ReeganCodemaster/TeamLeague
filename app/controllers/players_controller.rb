class PlayersController < ApplicationController
  before_action :set_player, only: %i[show edit update destroy delete]
  before_action :set_team

  def new  
    @player = @team.players.new()
    @coordinator = @team.password == params[:password] ? true : false
  end

  def create
    @player = @team.players.new(player_params)

    if @player.save
      redirect_to @team
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @coordinator = @team.password == params[:password] ? true : false
  end

  def update
    if @player.update(player_params)
      redirect_to @team
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def delete
    @coordinator = @team.password == params[:password] ? true : false
  end
  
  def destroy 
    @player.destroy
    redirect_to @team, status: 303
  end

  private
  def set_team 
    @team = Team.find(params[:team_id])
  end

  def set_player 
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:player_name)
  end
end
