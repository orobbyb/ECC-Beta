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


#     def search
#         # if params.nil? #using 'or' instead of '||' b/c that will eval and fail on the first .nil so the second doesn't error about :parameters not defined
#         #     @documents = []
#         #     return
#         # end
#         puts ">>>Here"
#         parameters = {
#             title: params[:title],
#             year: params[:year],
#             institution: params[:institution],
#             contributor: params[:contributor],
#             code_versions: params[:code_versions],
#             date_publish: params[:date_publish],
#             ecc_date: params[:ecc_date],
#             author_site: params[:author_site],
#             orig_url: params[:orig_url],
#             description: params[:description],
#             notes: params[:notes],
#             doi: params[:doi],
#             copyright: params[:copyright],
#             topics: params[:topics],
#             fields: params[:fields],
#             backup_url: params[:backup_url]

#         }

#         @documents = Document.search(query: { match: parameters})
        
# =======
    def search
        if params[:q].eql? ''
          redirect_to '\browse'
        else
          fetch_docs = Document.search params[:q]
          @documents = Kaminari.paginate_array(fetch_docs).page(params[:page]).per(5)
        end
    end
end
