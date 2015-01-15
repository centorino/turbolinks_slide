# turbolinks_slide

Easily add a slide effect to Turbolinks page changes.

## Installation

Add this line to your application's Gemfile:

    gem 'turbolinks_slide', github: 'centorino/turbolinks_slide'

And then execute:

    $ bundle install

## Usage

app/assets/javascripts/application.js
```
add this line.
//= require turbolinks_slide
```

```
turbolinks_slide = new TurbolinksSlide()

$(document).on 'page:fetch', (event) ->
  $('#content').animate(turbolinks_slide.animation_param(event), 250)
```

## Contributing

1. Fork it ( https://github.com/centorino/turbolinks_slide/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
