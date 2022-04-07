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

    def edit
        @team = Team.find(params[:id])
    end

    def create
        @team = Team.find(params[:id])

        if @team.update(teams_params)
            redirect_to @team
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @team = Team.find(params[:id])
        @team.destroy

        redirect_to root_path, status: 303
    end

    private

    def teams_params
        params.require(:team).permit(:title)
    end
end
