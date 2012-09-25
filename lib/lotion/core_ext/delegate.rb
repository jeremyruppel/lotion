# require extract_options

class Module
  include Forwardable

  ##
  #
  def delegate( *args )
    opts = args.extract_options!

    prefix = case opts[ :prefix ]
    when TrueClass
      "#{opts[ :to ]}_"
    when NilClass
      ''
    else
      "#{opts[ :prefix ]}_"
    end

    args.each do |name|
      def_delegator opts[ :to ], name, "#{prefix}#{name}".to_sym
    end
  end
end
