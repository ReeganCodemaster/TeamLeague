class PlayersController < ApplicationController
    def show
        @player = player.find(params[:id])
    end

    def new 
        @team = Team.find(params[:team_id])
        @player = @team.players.new()
    end

    def create
        @team = Team.find(params[:team_id])
        @player = @team.players.new(player_params)

        if @player.save
            redirect_to @team
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
    
    def player_params
        params.require(:player).permit(:player_name, :coordinator)
    end
end
