require 'elasticsearch/persistence/model'

class User
    # Use ES Presistance
    include Elasticsearch::Persistence::Model
    include ActiveModel::SecurePassword
    has_secure_password(validations: false)

    # Name the Index over here
    index_name 'user'
    
    # attributes
    attribute :name, String, mapping: {index: "not_analyzed"}
    attribute :password_digest, String, mapping: {index: "not_analyzed"}

    def self.find_by_name(name)
    users = User.search(query:{match:{name: name}})
    return nil if users.blank?
    return nil if users.count > 1
    return users.first
    rescue => ex
      return nil
  end

end