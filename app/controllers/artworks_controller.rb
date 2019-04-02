class ArtworksController < ApplicationController
     def index
        # debugger
        @artwork = Artwork.all
        render json: @artwork, status: 200
    end


    def show
        artwork = Artwork.find_by(id: params[:id])
        if artwork
            render json: artwork
        else
            render json: "No artwork here", status: 422
        end
    end

    def create
        artwork = Artwork.new(user_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: "No artwork here", status: 422
        elsif artwork.update(user_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def destroy
        artwork = Artwork.find_by(id: params[:id])
        if artwork.nil?
            render json: "No artwork here", status: 422
        else
            artwork.destroy
            render json: "Artwork gone", status: 200
        end
    end
    private

    def user_params
        debugger
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
