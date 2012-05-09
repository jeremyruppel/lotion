# Lotion

This library is a work in progress. Hit that "watch" button, son!

## Installation

RubyMotion projects don't come with a Gemfile by default. Create one:

    bundle init

Add this line to your application's Gemfile:

    gem 'lotion'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lotion

Finally, include Lotion in your project by adding the following to your Rakefile:

    # after require 'motion/project'
    require 'bundler'
    Bundler.require

    # inside app setup
    app.files += Lotion::Dependencies( __FILE__ )
    app.files_dependencies 'app/app_delegate.rb' => Lotion::Dependencies( __FILE__ )

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
