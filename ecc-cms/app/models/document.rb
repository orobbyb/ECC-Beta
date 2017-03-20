require 'elasticsearch/persistence/model'

class Document
  # Use ES Presistance
  include Elasticsearch::Persistence::Model

  # Name the Index over here
  index_name 'document'

  # Define the indexing over here - OPTIMIZE THIS!
  analyzed_and_raw = { fields: {
    name: { type: 'text', analyzer: 'snowball' },
    raw:  { type: 'keyword' }
  } }

  # Define all attributes and mapping types over here
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
  attribute :topics, String, default: [], mapping: analyzed_and_raw
  attribute :fields, String, default: [], mapping: analyzed_and_raw
  attribute :backup_url, String, mapping: analyzed_and_raw
  
  # Validations over here
  # validates :name, presence: true

  # Internal Methods over here
  def document
    Document.search(
      { query: {
          has_parent: {
            type: 'document',
            query: {
              bool: {
                filter: {
                  ids: { values: [ self.id ] }
                }
              }
            }
          }
        },
        size: 100
      },
      { type: 'document' }
  )
  end
end