module ColorRoutes
  VERSION="1.0.0"

  module Rails
    class Railtie < ::Rails::Railtie
      rake_tasks do
        load "color_routes/rails/tasks/color_routes.rake"
      end
    end
  end
end