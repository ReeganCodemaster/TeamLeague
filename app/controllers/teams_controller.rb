class TeamsController < ApplicationController
    def index
        @teams = Team.all
    end

    def show
        @team = Team.find(params[:id])
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(teams_params)
        
        if @team.save
            redirect_to @team
        else
            render :new , status: :unprocessable_entity
        end
    end

    private

    def teams_params
        params.require(:teams).permit(:title)
    end
end
