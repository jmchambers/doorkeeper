module Doorkeeper
  class AccessGrant
    
    include MongoMapper::Document
    timestamps!
    
    set_collection_name :oauth_access_grants

    key :resource_owner_id, ObjectId
    key :application_id, ObjectId
    key :token, String
    key :expires_in, Integer
    key :redirect_uri, String
    key :revoked_at, DateTime
    key :scopes, String

    def self.find_by_token(token)
      where(:token => token).first
    end
  end
end
