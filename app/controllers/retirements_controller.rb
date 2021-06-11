class RetirementsController < ApplicationController
    def destroy
        if current_user.destroy
            log_out
            redirect_to gossips_path
        end
    end
end
