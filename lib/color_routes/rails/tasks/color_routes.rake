desc 'Print out all defined routes in match order, with names. Target specific controller with CONTROLLER=x.'
task :color_routes => :environment do

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

  # concede ruby strings ANSI superpowers!
  require 'color_routes/string_ansi'

  # TODO: Extract table creation to a separate class.
  route_rows.group_by { |table| table[3][:controller] }.each do |controller, route_table|
    puts((controller ? controller.camelize : "No Specific Controller").color(:red))

    route_table.map! do |row|
      name = row[0]
      verb = row[1].color(:red)
      path = row[2].gsub(/(:[^\(\)\/]+)/) do $1.color(:cyan) end
      path = path.gsub(/([\/\.\(\)])/) do $1.color(:brown) end
      reqs = "{".color(:blue) + " #{row[3].map { |k, v| "#{k.inspect.color(:magenta)} #{"=>".color(:blue)} #{v.inspect.color(:white)}" }.sort.reverse.join(", ") }" + " }".color(:blue)
      [name, verb, path, reqs]
    end

    widths = [
      route_table.map{ |r| r[0].ansi_length }.max,
      route_table.map{ |r| r[1].ansi_length }.max,
      route_table.map{ |r| r[2].ansi_length }.max,
      route_table.map{ |r| r[3].ansi_length }.max
    ]
    widths.map! do |w| w < 6 ? 6 : w end 

    puts "+#{'-'*(widths[0]+2)}+#{'-'*(widths[1]+2)}+#{'-'*(widths[2]+2)}+#{'-'*(widths[3]-4)}+"
    route_table.each do |r|
      puts "| #{r[0].ansi_rjust(widths[0])} | #{r[1].ansi_ljust(widths[1])} | #{r[2].ansi_ljust(widths[2])} | #{r[3].ansi_ljust(widths[3])} |"
    end
    puts "+#{'-'*(widths[0]+2)}+#{'-'*(widths[1]+2)}+#{'-'*(widths[2]+2)}+#{'-'*(widths[3]-4)}+"

    puts
  end
end