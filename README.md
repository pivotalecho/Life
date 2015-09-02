# Conway

A ruby implementation of Conway's game of life.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'conway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conway

## Usage
1. Create a file with a starting grid, e.g.:

        # in-the-beginning.txt
        000
        010
        000

2. Watch it come to life

        $ conway in-the-beginning.txt

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/conway.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

