module GossipsHelper
    def permission_gossip?(gossip)
        gossip.user.id == session[:user_id]
    end
end
