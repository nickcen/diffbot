# Diffbot

Library for pulling data from the Diffbot API.

## Installation

Add this line to your application's Gemfile:

    gem 'diffbot'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install diffbot

## Usage

you can grab the entry with the +get+ method.

```ruby
 require 'diffbot'
 Diffbot::API.token = 'your diffbot token'
 article = Diffbot::Article.get("whatever url you want")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request