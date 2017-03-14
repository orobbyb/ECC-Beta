require 'elasticsearch/model'

class Document < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end

Document.import
