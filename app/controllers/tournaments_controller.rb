class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show edit update destroy delete]
  
  def index
    @tournaments = Tournament.all
  end
  
  def new
    @tournament = Tournament.new()
  end

  def create
    @tournament = Tournament.new(tournament_params)
    
    if @tournament.save
      redirect_to @tournament
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def set_tournament  
    @tournament = Tournament.find(params[:id])
  end
  
  def tournament_params
    params.require(:tournament).permit(:title, :team_num)
  end
end
