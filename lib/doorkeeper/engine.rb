module Doorkeeper
  class Engine < Rails::Engine
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end

    initializer "doorkeeper.routes" do
      Doorkeeper::Rails::Routes.install!
    end
  end
end
