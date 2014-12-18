class TurbolinksSlide
  constructor: ->
    @width = $(window).width()
    @event = null
  
  animation_param: (_event) ->
    @event = _event
    switch (@_animation_type())
      when 1
        return { marginLeft: "-#{@width}px", marginRight: "#{@width}px", opacity: 0.3 }
      when -1
        return { marginLeft: "#{@width}px", marginRight: "-#{@width}px", opacity: 0.3 }
      else
        return { opacity: 0 }
  
  _animation_type: ->
    curr_url = document.location.pathname
    curr_query = document.location.search
    next_url = @event.originalEvent.data.url.replace(document.location.origin, '')
    next_query = ''
    next_url_base = ''
    pos = next_url.indexOf('?')
    if pos >= 0
      next_query = next_url.substring(pos, next_url.length)
      next_url_base = next_url.substring(0, pos)

    if next_query != ''
      if curr_query != ''
        if pos > 0
          if (curr_url == next_url_base)
            if (next_query > curr_query)
              return 1
            else if (curr_query > next_query)
              return -1
            else
              return 0
        curr_url += curr_query
      else
        if pos > 0
          next_url = next_url_base
    
    return 0 if (curr_url == next_url)
    
    if (next_url.length > curr_url.length)
      return 1 if (next_url.indexOf(curr_url) >= 0)
      return 0
    else if (curr_url.length > next_url.length)
      return -1 if (curr_url.indexOf(next_url) >= 0)
      return 0
    else
      return 0

@TurbolinksSlide = TurbolinksSlide
