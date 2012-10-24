require 'color_routes'
require 'rails'
module ColorRoutes
  class Railtie < Rails::Railtie
    railtie_name :color_routes

    rake_tasks do
      load "tasks/color_routes.rake"
    end
  end
end