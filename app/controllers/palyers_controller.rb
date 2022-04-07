class PalyersController < ApplicationController
    def show
        @player = player.find(params[:id])
    end
end
