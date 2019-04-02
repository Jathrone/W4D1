class UsersController < ApplicationController
    def index
        # debugger
        @users = User.all
        render json: @users, status: 200
    end


    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user
        else
            render json: "No user here", status: 422
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        user = User.find_by(id: params[:id])
        if user.nil?
            render json: "No user here", status: 422
        elsif user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def destroy
        user = User.find_by(id: params[:id])
        if user.nil?
            render json: "No user here", status: 422
        else
            user.destroy
            render json: "User gone", status: 200
        end
    end
    private

    def user_params
        debugger
        params.require(:user).permit(:username)
    end
end