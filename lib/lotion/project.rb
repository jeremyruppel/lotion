require 'lotion'

Lotion.require do |graph|

  Motion::Project::App.setup do |app|
    # Add the app dir to the search path
    graph.path << './app'

    # Scan the app dir for dependent files
    graph.scan './app/**/*.rb'

    # Scan the specs dir for dependent files
    # FIXME add once https://github.com/HipByte/RubyMotion/pull/84 merges
    graph.scan File.join( app.specs_dir, '**/*.rb' ) # if app.spec_mode

    # Add the dependency graph to the app
    app.files += graph.files
    app.files_dependencies graph
  end
end
