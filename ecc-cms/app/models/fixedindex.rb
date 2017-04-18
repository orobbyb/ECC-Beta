require 'elasticsearch/persistence/model'

class FixedIndex
    # Use ES Presistance
    include Elasticsearch::Persistence::Model

    # Name the Index over here
    index_name 'fixedindex'
    
    # attributes
    attribute :type, String, mapping: {index: "not_analyzed"}
    attribute :restrictions, String, mapping: {index: "not_analyzed"}

    #returns the json document containing 
    def self.fetchList(q) #q = one of the fixed list types, currently one of "institutions, field, topics" 
      fixedindex = Fixedindex.search(query:{match:{:type=> q}})
      return fixedindex
      rescue => ex
      return nil
    end


    #type is not defined in fixedindex documents, instead set as 'index' subtype
    def self.fixedList2(q)
      return FixedIndex.search index: 'fixedindex', type: 'institutions'
      
    end 

    def self.setInstitutions()
      #institutions = []
      docs = Fixedindex.search index: 'fixedindex', type: 'institutions'
      docs = docs.to_a
      for doc in docs
        @institutions.append(doc.name)
      end
    end

end

#fixed_index_documents
=begin
{
  "id_": 
  "type": ["institutions","field","topics"]
  "restrictions": []
}=end


Get /_search
{
  "query": {
    "bool": 
  }
}
