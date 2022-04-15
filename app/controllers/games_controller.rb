class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy delete]
  before_action :set_team

  private
  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_game
    @game = @team.games.find(params[:id])
  end

  def games_params
    params.require(:games).permit
  end
end
