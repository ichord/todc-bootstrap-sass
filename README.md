This is a `sass` edition of the [TODC Bootstrap](http://todc.github.com/todc-bootstrap/) project.  
It's more like a patch!! so it must be work with another `bootstrap` gem such as [bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass)  

PS. It is changed name from `bootstrap-google-sass`.

## For Rails 3

### Installation

Add this line to your application's Gemfile:

    gem 'todc-bootstrap-sass'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todc-bootstrap-sass

### Usage

For now, just support `rails 3+`  

just like it:

```scss

@import "bootstrap";
@import "todc-bootstrap";

```

and then, enjoy it.

## For Campass

### Config

require them in `config.rb` file of **Compass**

```ruby

require 'bootstrap-sass'
require 'todc-bootstrap-sass'

```

## One more thing.
You can now running testing by issue `rake test`.  
And, issue `rake css` to generate a full support `css` edition without another gem and css file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
