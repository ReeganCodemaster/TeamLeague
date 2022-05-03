class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show edit update destroy]
  
  def index
    @tournaments = Tournament.all
  end
  
  def show 
    @team_num = @tournament.team_num
    @games = @tournament.games
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

    points_service = PointsService.new
    @points = points_service.call
    @points.length/2.times do
      last_index = @points.length-1
      @tournament.games.create(team_1_id:@points[0][0], team_2_id:@points.last[0])
      @points.shift
      @points.pop
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
