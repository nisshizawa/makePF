class ApplicationController < ActionController::Base
    def guest_check
        if current_user.email == User.find_by(email: 'guest@example.com') 
            redirect_to root_path
        end
    end    
end
