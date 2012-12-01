desc 'Pretty version on rails rake routes.'

EMK="\033[1;30m"
EMR="\033[1;31m"
EMG="\033[1;32m"
EMY="\033[1;33m"
EMB="\033[1;34m"
EMM="\033[1;35m"
EMC="\033[1;36m"
EMW="\033[1;37m"
NOCOLOR = "\033[0m"

task :color_routes => :environment do

  Rails.application.reload_routes!
  all_routes = Rails.application.routes.routes.to_a
  all_routes.reject! { |route| route.verb.nil? || route.path.spec.to_s == '/assets' }
  all_routes.select! { |route| ENV['CONTROLLER'].nil? || route.defaults[:controller].to_s == ENV['CONTROLLER'] }

  names_max_width = all_routes.map { |route| route.name.to_s.length }.max
  verbs_max_width = 6
  paths_max_width = all_routes.map { |route| route.path.spec.to_s.length }.max
  controllers_max_width = all_routes.map { |route| route.defaults[:controller].to_s.length }.max
  actions_max_width = all_routes.map { |route| route.defaults[:action].to_s.length }.max

  all_routes.group_by { |route| route.defaults[:controller] }.each_value do |group|
    puts EMK + "\nCONTROLLER: " + EMW + group.first.defaults[:controller].to_s + NOCOLOR
    group.each do |route|
      name = EMC + route.name.to_s.rjust(names_max_width) + NOCOLOR
      verb = EMY + route.verb.inspect.gsub(/^.{2}|.{2}$/, "").center(verbs_max_width) + NOCOLOR
      path = EMR + route.path.spec.to_s.ljust(paths_max_width).gsub(/(\.?:[^\(\)\/]+)/) { EMB + $1 + EMR } + NOCOLOR
      action = EMW + route.defaults[:action].to_s.ljust(actions_max_width) + NOCOLOR

      puts "|#{name}|#{verb}|#{path}|#{action}"
    end
  end
end