class CommentsController < ApplicationController
    before_action :require_login
    def new 
    end

    def create 
        gossip = Gossip.find(params[:gossip_id])
        @comment = current_user.comments.build do |t|
            t.gossip = gossip
            t.content = params[:comment][:content]
        end
        if @comment.save 
            redirect_to gossip
        end
    end

    def destroy
    end

    private 
    def require_login
        unless logged_in?
            redirect_to login_path
        end
    end
end
