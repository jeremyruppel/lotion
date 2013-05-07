require 'codependency'

unless defined?( Motion::Project::Config )
  raise <<-EOS
====================================================
This file must be required in a RubyMotion Rakefile.
====================================================
  EOS
end

Motion::Project::App.setup do |app|
  graph = Codependency::Graph.new

  graph.path << './app'
  graph.path << './lib'

  graph.scan './app/**/*.rb'

  # FIXME for some reason, app.spec_mode == false here,
  # both in guard-motion and regular rake spec. wtf?
  # Ideally, this line should only run if app.spec_mode
  graph.scan File.join( app.specs_dir, '**/*.rb' )

  app.files += graph.files
  app.files_dependencies graph
end
