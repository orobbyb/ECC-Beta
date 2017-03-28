require 'elasticsearch/persistence/model'

class Fixedindex
    # Use ES Presistance
    include Elasticsearch::Persistence::Model

    # Name the Index over here
    index_name 'fixedindex'
    
    # attributes
    attribute :institution, String, mapping: {index: "not_analyzed"}
    attribute :restrictions, String, mapping: {index: "not_analyzed"}

    def self.find_list(q)
    fixedindex = Fixedindex.search(query:{match:{:institution: q}})
    return fixedindex
    rescue => ex
      return nil
  end

end
