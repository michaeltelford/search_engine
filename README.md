# Search Engine

Search engine front end site developed using Ruby, Sinatra (web framework), Thin (templating engine) and the '[wgit](https://github.com/michaeltelford/wgit)' gem (search engine logic).

## Versioning

- `ruby-2.7.4`

### Assets

- `jquery`
- `tether`
- `bootstrap`
- `font-awesome`

See the `Gemfile` and `Gemfile.lock` files for gem versioning information.

## Dependencies

- A Javascript runtime e.g. [`node`](https://nodejs.org/en/)

## Usage

Start the app in development mode and open it in a browser with:

    $ bundle exec rake browse

See all the available rake tasks with:

    $ bundle exec rake help

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests.

Run `bundle exec ./bin/console` for an interactive prompt that will allow you to experiment or you can call `byebug` anywhere in the code or tests to debug.

Github is used as the main code repository. Heroku is used to deploy the app. Any code pushed to Heroku gets deployed so best to wait for a release rather than pushing every little change. Also, test the Heroku deploy post push.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaeltelford/search_engine.

## License

The website is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
