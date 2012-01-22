
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'color_routes'
  s.version           = '0.0.2'
  s.date              = '2012-01-22'
  s.rubyforge_project = 'color_routes'

  s.summary     = "Colorize rake routes output for rails."
  s.description = "Colorize rake routes output for rails."

  s.authors  = ["Nicolas Oga"]
  s.email    = '2112.oga@gmail.com'
  s.homepage = 'http://nicooga.github.com/NAME'

  s.require_paths = %w[lib]

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE doc/demo.png]

  s.add_dependency('Tablizer', ["~> 1.0.3"])

  # = MANIFEST =
  s.files = %w[
    LICENSE
    README.md
    Rakefile
    color_routes.gemspec
    doc/demo.png
    lib/color_routes.rb
    lib/color_routes/rails/tasks/color_routes.rake
    lib/color_routes/string_ansi.rb
  ]
  # = MANIFEST =
end