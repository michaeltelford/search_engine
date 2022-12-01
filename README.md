# Search Engine

Search engine UI developed using:

- Ruby
- [wgit](https://github.com/michaeltelford/wgit) (search engine logic)
- Sinatra (web framework)
- Thin (templating engine)

Check out the demo search engine here:

```
https://wgit-search-engine.fly.dev
```

## Versioning

- `ruby-3.0.2`

### Assets

- `simplecss`       -> Styling
- `font-awesome`    -> Icons

See the `Gemfile` and `Gemfile.lock` files for gem versioning information.

## Dependencies

- A Javascript runtime e.g. [`node`](https://nodejs.org/en/)

## Usage

Start the app in development mode and open it in a browser with:

    $ bundle exec rake browse
    $ bundle exec rake serve # To manually open the URL yourself

See all the available rake tasks with:

    $ bundle exec rake help

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake test` to run the tests.

Run `bundle exec ./bin/console` for an interactive prompt that will allow you to experiment or you can call `byebug` anywhere in the code or tests to debug.

Github is used as the main code repository. Fly.io is used to deploy the demo app (URL above). To deploy, run `flyctl deploy` inside the root of the repo (once authenticated).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaeltelford/search_engine.

## License

The website is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
