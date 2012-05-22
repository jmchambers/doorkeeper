module Doorkeeper
  class AccessToken
    
    include MongoMapper::Document
    timestamps!

    set_collection_name :oauth_access_tokens

    key :resource_owner_id, ObjectId
    key :token, String
    key :refresh_token, String
    key :expires_in, Integer
    key :revoked_at, DateTime
    key :scopes, String

    def self.find_by_token(token)
      where(:token => token).first
    end

    def self.find_by_refresh_token(refresh_token)
      where(:refresh_token => refresh_token).first
    end
  end
end
