require 'elasticsearch/persistence/model'

class Fixedindex
    # Use ES Presistance
    include Elasticsearch::Persistence::Model

    # Name the Index over here
    index_name 'fixedindex'
    
    # attributes
    attribute :type, String, mapping: {index: "not_analyzed"}
    attribute :restrictions, String, mapping: {index: "not_analyzed"}



    def self.fetchIndex()
      docs = Fixedindex.search index:index_name
      for doc in docs
        if doc._type.eql?("institutions")
          @fixedindex.institutions.names.append(doc.name)
          @fixedindex.institutions.docs.append(doc)
        elsif doc._type.eql?("types")
          @fixedindex.types.names.append(doc.name)
          @fixedindex.types.docs.append(doc)
        elsif doc._type.eql?("fields")
          @fixedindex.fields.names.append(doc.name)
          @fixedindex.fields.docs.append(doc)
        end
      end
  
    end
=begin
    #returns the json document containing 
    def self.fetchList(q) #q = one of the fixed list types, currently one of "institutions, field, topics" 
      fixedindex = Fixedindex.search(query:{match:{:type=> q}})
      return fixedindex
      rescue => ex
      return nil
    end
=end

=begin
    #type is not defined in fixedindex documents, instead set as 'index' subtype
    def self.fixedList(q)
      docs = Fixedindex.search index: 'fixedindex', type: q
      return docs
    end 

    def self.setInstitutions()
      #institutions = []
      docs = Fixedindex.search index: 'fixedindex', type: 'institutions'
      for doc in docs
        @institutions.append(doc.name)
      end
    end

    def self.setTopics()
      #institutions = []
      docs = Fixedindex.search index: 'fixedindex', type: 'topics'
      for doc in docs
        @topics.append(doc.name)
      end
    end

    def self.setFields()
      #institutions = []
      docs = Fixedindex.search index: 'fixedindex', type: 'fields'
      for doc in docs
        @fields.append(doc.name)
      end
    end
end

#fixed_index_documents
=begin
{
  "id_": 
  "type": ["institutions","field","topics"]
  "restrictions": []
}
Get /_search
{
  "query": {
    "bool": 
  }
}

=end


