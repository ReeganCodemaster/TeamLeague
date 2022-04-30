class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[show edit update destroy delete]
  
  def index
    @tournaments = Tournament.all
  end
  
  private
  def set_tournament  
    @tournament = Tournament.find(params[:id])
  end

end
