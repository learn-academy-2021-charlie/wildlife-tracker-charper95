class SightingsController < ApplicationController
    def index
        sighting = Sighting.all
        render json: sighting
    end

    def show
        sighting = Sighting.find(params[:id])
        render json: sighting
    end
end
