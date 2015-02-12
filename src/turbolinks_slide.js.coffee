class TurbolinksSlide
  constructor: ->
    @width = $(window).width()
    @event = null
    @curr_url = { path: '', query: '' }
    @next_url = { path: '', query: '' }
  
  animation_param: (_event) ->
    @event = _event
    
    switch (@_animation_type())
      when 1
        return { marginLeft: "-#{@width}px", marginRight: "#{@width}px", opacity: 0.5 }
      when -1
        return { marginLeft: "#{@width}px", marginRight: "-#{@width}px", opacity: 0.5 }
      else
        return { opacity: 0 }
  
  _animation_type: ->
    @_set_url()

    if @_is_same_path()
      if @_is_both_have_query_strings()
        return @_ufo(@curr_url.query, @next_url.query)
      return 0
    
    if (@next_url.path.length > @curr_url.path.length)
      return 1 if (@next_url.path.indexOf(@curr_url.path) >= 0)
    else if (@curr_url.path.length > @next_url.path.length)
      return -1 if (@curr_url.path.indexOf(@next_url.path) >= 0)
      
    return 0
    
  _ufo: (a, b) ->
    return 1 if (a < b)
    return -1 if (a > b)
    return 0
  
  _set_url: ->
    @curr_url = { path: document.location.pathname, query: document.location.search.replace('?', '') }
    
    next_full_url = @event.originalEvent.data.url.replace(document.location.origin, '')
    next_full_url = next_full_url.split('?')
    @next_url = { path: next_full_url[0], query: (if (next_full_url.length > 1) then next_full_url[1] else '') }

    cq = @curr_url.path.match(/\/[\-0-9]+/g)
    nq = @next_url.path.match(/\/[\-0-9]+/g)
    if (cq != '' && nq != '')
      if (@curr_url.path.replace(cq, '') == @next_url.path.replace(nq, ''))
        @curr_url = { path: @curr_url.path.replace(cq, ''), query: cq }
        @next_url = { path: @next_url.path.replace(nq, ''), query: nq }

  _is_both_have_query_strings: ->
    return (@curr_url.query != '' && @next_url.query != '')
  
  _is_same_path: ->
    return (@curr_url.path == @next_url.path)
  
@TurbolinksSlide = TurbolinksSlide
