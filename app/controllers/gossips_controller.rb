class GossipsController < ApplicationController
    def index 
        @gossips = Gossip.page(params[:page]).per(5).all
    end

    def show 
        @gossip = Gossip.find(params[:id])
        @gossips = Gossip.where(user_id: @gossip.user.id)
        @comments = @gossip.comments.includes(:user)
    end

    def new 
        @gossip = current_user.gossips.build
    end

    def create 
        @gossip = current_user.gossips.build(gossip_params)
        if @gossip.save
            redirect_to gossips_path
        end
    end

    def edit
        @gossip = Gossip.find(params[:id]) 
    end

    def update 
        @gossip = Gossip.find(params[:id])
        @gossip.update(gossip_params)
        redirect_to gossips_url
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossips_url 
    end

    private 
    def gossip_params 
        params.require(:gossip).permit(:title,:content)
    end
end
