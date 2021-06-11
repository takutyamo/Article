class UsersController < ApplicationController
    before_action :require_login, only: [:destroy, :edit, :show]

    def index 
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            redirect_to '/login'
        end
    end

    def edit 
        @user = User.find(session[:user_id])
    end

    def update 
        @user = User.find(session[:user_id])
        @user.update(user_params)
        redirect_to gossips_path
    end

    def destroy 
    end

    private 
    def user_params 
        params.require(:user).permit(:name,:email,:password, :avatar, :comment)
    end

    def require_login
        unless logged_in?
            redirect_to login_path
        end
    end
end
