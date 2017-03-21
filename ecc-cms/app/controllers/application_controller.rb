class ApplicationController < ActionController::Base
   before_action :authorize # needed to allow for site to work
   protect_from_forgery with: :exception

    # ...

  protected
    def authorize
      begin
        User.search(query:{match:{id: session[:user_id]}})
      rescue
        redirect_to login_url, notice: "Please log in"
      end
    end
end
