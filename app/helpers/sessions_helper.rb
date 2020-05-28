module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    def log_out(user)
        session.delete(user:id)
        @current_user = nil
    end
end
