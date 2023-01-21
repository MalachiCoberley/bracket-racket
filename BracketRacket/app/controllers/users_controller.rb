class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def new
        @user = User.new
    end

    # postgres can probably assign a unique id that isn't random number BS. figure that out
    def create
        @user = User.new(user_params)
        @user.league_id = rand(1..1000000000)
        
        if @user.save
          redirect_to @user
        else
          render :new, status: :unprocessable_entity
        end
    end

    private
    def user_params
      params.require(:username)
    end

end
