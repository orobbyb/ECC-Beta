class ApplicationController < ActionController::Base
  # before_action :authorize # just for testing
  protect_from_forgery with: :exception

    # ...

  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end