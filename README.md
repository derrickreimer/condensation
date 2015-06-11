# Condensation

A collection of handy Liquid filters. Developed for [Drip](https://www.getdrip.com).

## Installation

Add this line to your application's Gemfile:

    gem 'condensation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install condensation

## Usage

To make all the filters available in your Liquid templates, place this call
in your app initialization code:

```ruby
Condensation.register_filters
```

For example, in a Rails app, you'll likely place this in an initializer.
To pick and choose which filters you like, just register them manually:

```ruby
Liquid::Template.register_filter(Condensation::Filters::DaysUntil)
```

Explore all the available filters [here](https://github.com/djreimer/condensation/tree/master/lib/condensation/filters).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
