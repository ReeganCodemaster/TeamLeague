class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show edit update destroy]
  
  def index
    @tournaments = Tournament.all
  end
  
  def show 
    @team_num = @tournament.team_num
    
    team_fact = @tournament.team_num
  	team_fact = @tournament.team_num.downto(1) {|x| team_fact *= x }
    composite_fact = (@tournament.team_num - (@tournament.team_num - 1))
    composite_fact = (@tournament.team_num - (@tournament.team_num - 1)).downto(1) {|x| composite_fact *= x }
    @rounds = team_fact / (2 * composite_fact)
    points_service = PointsService.new
    @teams = points_service.call
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
  
  def update
    if @tournament.update(tournament_params)
      redirect_to @tournament
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @tournament.destroy

    redirect_to '/tournaments', status:303
  end
  
  private
  def set_tournament  
    @tournament = Tournament.find(params[:id])
  end
  
  def tournament_params
    params.require(:tournament).permit(:title, :team_num)
  end
end
