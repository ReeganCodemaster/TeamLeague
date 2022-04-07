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
    
    def edit
        @team = Team.find(params[:team_id])
        @player = @team.players.find(params[:id])
    end

    def update
        @team = Team.find(params[:team_id])
        @player = @team.players.find(params[:id])

        if @player.update(player_params)
            redirect_to @team
        else
            render :edit , status: :unprocessable_entity
        end
    end

    def destroy 
        @team = Team.find(params[:team_id])
        @player = @team.players.find(params[:id])

        @player.destroy

        redirect_to @team, status: 303
    end

    private
    
    def player_params
        params.require(:player).permit(:player_name, :coordinator)
    end
end
