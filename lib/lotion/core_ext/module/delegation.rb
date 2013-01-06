# require core_ext/array/extract_options

class Module

  # TODO support paths somehow, like :to => :'self.class'
  # TODO support constants, like :to => :AppDelegate
  def delegate( *methods )
    options = methods.extract_options!

    unless options.has_key?( :to )
      raise ArgumentError, 'Module#delegate: The :to option is required'
    end

    prefix = case options[ :prefix ]
    when TrueClass
      "#{options[ :to ]}_"
    when Symbol
      "#{options[ :prefix ]}_"
    else
      ''
    end

    methods.each do |name|
      define_method "#{prefix}#{name}" do |*args, &block|
        send( options[ :to ] ).send name, *args, &block
      end
    end
  end
end
