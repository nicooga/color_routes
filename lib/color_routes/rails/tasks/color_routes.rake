desc 'Print out all defined routes in match order, with names. Target specific controller with CONTROLLER=x.'
task :color_routes => :environment do
  require 'tablizer'
  Rails.application.reload_routes!
  all_routes = Rails.application.routes.routes

  if ENV['CONTROLLER']
    all_routes = all_routes.select{ |route| route.defaults[:controller] == ENV['CONTROLLER'] }
  end

  routes = all_routes.collect do |route|
    reqs = route.requirements.dup
    reqs[:to] = route.app unless route.app.class.name.to_s =~ /^ActionDispatch::Routing/
    {:name => route.name.to_s, :verb => route.verb.to_s, :path => route.path, :reqs => reqs}
  end
  
  # Skip the route if it's internal info route
  routes.reject! { |r| r[:path] =~ %r{/rails/info/properties|^/assets} }

  route_rows = routes.map do |r|
    [
      r[:name].presence || "-",
      r[:verb].presence || "-",
      r[:path].presence || "-",
      r[:reqs]
    ]
  end

  route_rows.group_by { |table| table[3][:controller] }.each do |controller, route_table|
    puts((controller ? controller.camelize : "No Specific Controller").color(:red))

    table = Tablizer::Table.new
    
    row = 0
    route_table.each do |row|
      name = row[0]
      verb = row[1].color(:red)
      path = row[2].gsub(/(:[^\(\)\/]+)/) do $1.color(:cyan) end
      path = path.gsub(/([\/\.\(\)])/) do $1.color(:brown) end
      reqs = "{".color(:blue) + " #{row[3].map { |k, v| "#{k.inspect.color(:magenta)} #{"=>".color(:blue)} #{v.inspect.color(:white)}" }.sort.reverse.join(", ") }" + " }".color(:blue)
      
      table[row, 0] = name
      table[row, 1] = verb
      table[row, 2] = path
      table[row, 3] = reqs

      row = row + 1
    end

    puts table
  end
end