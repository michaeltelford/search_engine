# SearchEngine

Search engine front end site developed using Ruby, Sinatra (web framework), Thin (templating engine) and the '[wgit](https://github.com/michaeltelford/wgit)' gem (search engine logic).

## Versioning

- `ruby-2.4.0`
- `jquery-3.2.1`
- `tether-1.3.3`
- `bootstrap-4.0.0`

See the `Gemfile` and `Gemfile.lock` files for gem versioning information.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'search_engine'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install search_engine

## Usage

Run the application server with:

    $ bundle exec rake serve

See all the rake tasks with:

    $ bundle exec rake -T

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaeltelford/search_engine.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
