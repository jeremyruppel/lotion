module Lotion
  module Inflector
    extend self

    ##
    #
    def underscore( str )
      str.gsub( '::', '/' ).gsub( /([a-z])([A-Z])/, '\1_\2' ).downcase
    end

    ##
    #
    def classify( str )
      camelize( str ).gsub( /\/([a-zA-Z])/ ){ |m| "::#{$1.upcase}" }
    end

    ##
    #
    def camelize( str )
      str.capitalize.gsub( /_([a-zA-Z])/ ){ |m| $1.upcase }
    end

    ##
    #
    def demodulize( str )
      str.split( '::' ).pop
    end

    ##
    #
    def constantize( str )
      str.split( '::' ).reduce( Kernel ) do |memo, name|
        memo.const_get name
      end
    end
  end
end
