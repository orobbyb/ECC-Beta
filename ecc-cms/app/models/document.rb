# require 'elasticsearch/model'

class Document < ApplicationRecord
#   include Elasticsearch::Model
#   include Elasticsearch::Model::Callbacks
end

# Document.import force: true

# def self.search(query)
#   __elasticsearch__.search(
#     {
#       query: {
#         multi_match: {
#           query: query,
#           fields: ['description^10', 'text']
#         }
#       }
#     }
#   )
# end