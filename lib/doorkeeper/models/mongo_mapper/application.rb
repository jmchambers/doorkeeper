module Doorkeeper
  class Application

    include MongoMapper::Document
    timestamps!

    set_collection_name :oauth_applications

    key :name, String
    key :uid, String
    key :secret, String
    key :redirect_uri, String

    def self.find_by_uid(uid)
      where(:uid => uid).first
    end

    def self.find_by_secret(secret)
      where(:secret => secret).first
    end

    def self.find_by_uid_and_secret(uid, secret)
      where(:uid => uid, :secret => secret).first
    end

    def self.authorized_for(resource_owner)
      ids = AccessToken.where(:resource_owner_id => resource_owner.id, :revoked_at => nil).map(&:application_id)
      find(ids)
    end
  end
end
