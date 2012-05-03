module Doorkeeper
  module Rails
    class Routes
      module Helper
        def use_doorkeeper(options = {})
          Doorkeeper::Rails::Routes.new(self).generate_routes!(options)
        end
      end

      def self.install!
        ActionDispatch::Routing::Mapper.send :include, Doorkeeper::Rails::Routes::Helper
      end

      attr_accessor :mapper

      def initialize(mapper)
        @mapper = mapper
      end

      def generate_routes!(options)
        mapper.scope 'oauth', :module => :doorkeeper do
          mapper.get    'authorize', :to => "authorizations#new",     :as => :doorkeeper_authorization
          mapper.post   'authorize', :to => "authorizations#create",  :as => :doorkeeper_authorization
          mapper.delete 'authorize', :to => "authorizations#destroy", :as => :doorkeeper_authorization
          mapper.post   'token',     :to => "tokens#create",          :as => :doorkeeper_token
          mapper.resources :applications, :as => :doorkeeper_applications
          mapper.resources :authorized_applications, :only => [:index, :destroy], :as => :doorkeeper_authorized_applications
        end
      end
    end
  end
end
