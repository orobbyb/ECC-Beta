#http://www.rubydoc.info/gems/elasticsearch-api/Elasticsearch/API/Actions#search-instance_method

class SearchController < ApplicationController
  skip_before_action :authorize
  # Use params[:query] to search the DB - Over here
    # Use result from DB to redirect the user to the correct location
    # def search
    #     if params[:q].nil?
    #         @documents = []
    #     else
    #         @documents = Document.search params[:q] # q matches keywords
    #     end
    # end

    def searchByParams
        if params.nil? or params[:parameters].nil? #using 'or' instead of '||' b/c that will eval and fail on the first .nil so the second doesn't error about :parameters not defined
            @documents = []
            return
        end
        
        parameters = {
            title: params[:title],
            year: params[:year],
            institution: params[:institution],
            contributor: params[:contributor],
            code_versions: params[:code_versions],
            date_publish: params[:date_publish],
            ecc_date: params[:ecc_date],
            author_site: params[:author_site],
            orig_url: params[:orig_url],
            description: params[:description],
            notes: params[:notes],
            doi: params[:doi],
            copyright: params[:copyright],
            topics: params[:topics],
            fields: params[:fields],
            backup_url: params[:backup_url]

        }

        @documents = Document.search body:{
            query: { match: parameters} # parameters should be a json with attributes defined that they want to search for as given below
        }
        
    end
end

#params will either have some of these, or they'll be blank

#Params:
=begin
attribute :title, String, mapping: analyzed_and_raw
attribute :year, String, mapping: analyzed_and_raw
attribute :institution, String, mapping: analyzed_and_raw
attribute :contributor, String, mapping: analyzed_and_raw
attribute :code_versions, String, default: [], mapping: analyzed_and_raw
attribute :date_publish, Date
attribute :ecc_date, Date
attribute :author_site, String, mapping: analyzed_and_raw
attribute :orig_url, String, mapping: analyzed_and_raw
attribute :description, String, mapping: analyzed_and_raw
attribute :notes, String, mapping: analyzed_and_raw
attribute :doi, String, mapping: analyzed_and_raw
attribute :copyright, String, mapping: analyzed_and_raw
attribute :topics, String, mapping: analyzed_and_raw
attribute :fields, String, mapping: analyzed_and_raw
attribute :backup_url, String, mapping: analyzed_and_raw

=end
