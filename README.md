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

## Commands

**Avoid doing any asynchronous work in your commands.**

Commands are meant to represent one unit of work and are stateless.
More practically, commands are garbage collected almost immediately,
so attempting any asynchronous work can cause hard-to-debug errors.

Consider this situation: We have a client that can fetch some user
data and a command that tells the client to do so.

``` ruby
class FetchTweetsCommand < Lotion::Command

  def call
    app.twitter_client.fetch 'jeremyruppel' do |response|
      notify 'tweets:fetched'
    end
  end
end

class TwitterClient

  def fetch( username, &block )
    # ... some async call here that eventually calls the block
  end
end
```

This is bound to cause problems because by the time the response
comes back, the command has been garbage collected. The response
in the block is still in memory, but the `notify` method is not.
A more reliable approach would look like this:

``` ruby
class FetchTweetsCommand < Lotion::Command

  def call
    app.twitter_client.fetch 'jeremyruppel'
  end
end

class TwitterClient
  include Lotion::Actor

  def fetch( username )
    # ... some async call here that eventually calls the `success` lambda
  end

  def success
    lambda do |response|
      notify 'tweets:fetched'
    end
  end
end
```

This works because the reference to the client is maintained. Our
context is still notified of the response and we can still attach
commands to the notification as we wish.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
