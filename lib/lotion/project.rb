require 'lotion'

module Lotion
  module Project

    # FIXME remove once https://github.com/HipByte/RubyMotion/pull/90 merges
    def files_dependencies(deps_hash)
      res_path = lambda do |x|
        path = /^\.{0,2}\//.match(x) ? x : File.join('.', x)
        unless @files.flatten.include?(path)
          App.fail "Can't resolve dependency `#{path}'"
        end
        path
      end
      deps_hash.each do |path, deps|
        deps = [deps] unless deps.is_a?(Array)
        @dependencies[res_path.call(path)] = deps.map(&res_path)
      end
    end
  end
end

Lotion.require do |graph|

  Motion::Project::App.setup do |app|
    app.extend Lotion::Project

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
