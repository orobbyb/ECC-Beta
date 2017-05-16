class SearchController < ApplicationController
  skip_before_action :authorize
  # Use params[:query] to search the DB - Over here
    # Use result from DB to redirect the user to the correct location
    def search
        if params[:q].eql? ''
          redirect_to '\browse'
        else
          fetch_docs = Document.search params[:q]
          @documents = Kaminari.paginate_array(fetch_docs).page(params[:page]).per(5)
        end
    end
end
