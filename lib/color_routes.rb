module ColorRoutes
  VERSION="0.0.2"

  module Rails
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "color_routes/rails/tasks/color_routes.rake"
      end
    end
  end
end