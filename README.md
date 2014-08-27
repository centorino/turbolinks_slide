turbolinks_slide
================

Easily add a slide effect to Turbolinks page changes.

usage
-----
```
turbolinks_slide = new TurbolinksSlide()

$(document).on 'page:fetch', ->
  $('#content').animate(turbolinks_slide.animation_param())
```
