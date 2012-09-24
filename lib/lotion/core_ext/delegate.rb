# require extract_options

class Module

  ##
  #
  def delegate( *args )
    opts     = args.extract_options!
    receiver = opts.delete :to

    args.each do |method|
      class_eval <<-EOS
        def #{method}( *args, &block )
          if #{receiver} && #{receiver}.respond_to?( #{method.inspect} )
            #{receiver}.send #{method.inspect}, *args, &block
          end
        end
      EOS
    end
  end
end
