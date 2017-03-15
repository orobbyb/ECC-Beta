class SearchController < ApplicationController
    # Use params[:query] to search the DB - Over here
    # Use result from DB to redirect the user to the correct location
    def search
    if params[:q].nil?
        @articles = []
    else
        @articles = Article.search params[:q]
    end
end
