# Bootstrap::Google::Sass

The scss files are translated form [TODC Bootstrap](http://todc.github.com/todc-bootstrap/) project.

This is the `sass` edition of the [google-bootstrap](http://todc.github.com/google-bootstrap) project.  
Now, it's Non-Rails supported now.

## Installation

Add this line to your application's Gemfile:

    gem 'bootstrap-google-sass'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bootstrap-google-sass

## Usage

For now, just support `rails 3+`  
It more like a patch!! so it must work with another `bootstrap` gem such as [bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass)  
just like it:

```scss

@import "bootstrap";
@import "bootstrap-google";

```

and then, enjoy it.

### One more thing.
You can now running testing by issue `rake test`.  
And, issue `rake css` to generate a full support `css` edition without another gem and css file.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
