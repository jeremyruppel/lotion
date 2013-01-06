# require core_ext/array/extract_options

class Module

  # TODO support :prefix option
  # TODO raise hell if :to is not specified
  # TODO support paths somehow, like :to => :'self.class'
  # TODO support constants, like :to => :AppDelegate
  def delegate( *methods )
    options = methods.extract_options!

    methods.each do |name|
      define_method name do |*args, &block|
        send( options[ :to ] ).send name, *args, &block
      end
    end
  end
end
