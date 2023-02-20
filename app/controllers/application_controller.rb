class ApplicationController < ActionController::Base
    def require_user

        if guest?
            flash[:notice] = "You must be logged in to do that."
            redirect_to login_path
        end
    end

    def signed_in?
        if !guest?
            flash[:notice] = "You are already signed in."
            redirect_to blogs_path
        end
    end

    def guest?
        !helpers.logged_in?
    end
end
