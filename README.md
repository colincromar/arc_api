# Arc Api

A Ruby wrapper for the [Arc API](https://tw.instructuremedia.com/api/public/docs/#/ )

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arc_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arc_api

## Usage

Initialize a new Client - ArcApi::Client.new(prefix: <instructuremedia url>, user_id: <arc user id>, token: <arc session token>)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
