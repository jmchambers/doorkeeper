if defined? ActiveRecord
  class User < ActiveRecord::Base
  end
end

if defined? Mongoid
  class User
    include Mongoid::Document
    include Mongoid::Timestamps

    field :name, :type => String
  end
end

if defined? MongoMapper
  class User
    include MongoMapper::Document
    timestamps!

    key :name, String
  end
end