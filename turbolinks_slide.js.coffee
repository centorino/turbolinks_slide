class TurbolinksSlide
  constructor: ->
    @current_absolute_path = null
    @current = {controller: null, action: null, param: null}
    @width = $(window).width()
    @_set_params()
  
  animation_param: ->
    @_set_params()
    switch (@_animation_type())
      when 1
        return { marginLeft: "-#{@width}px", marginRight: "#{@width}px", opacity: 0.3 }
      when -1
        return { marginLeft: "#{@width}px", marginRight: "-#{@width}px", opacity: 0.3 }
      else
        return { opacity: 0 }
  
  _animation_type: ->
    if (@previous.controller == @current.controller)
      switch (@previous.action)
        when 'index'
          return 1 if (@current.action != 'index')
          break
        when 'new', 'edit', 'show'
          return -1 if (@current.action == 'index')
          break
        else
          break
    return 0
  
  _domain_removed_current_url: ->
    port = if document.location.port == '' then '' else ":#{document.location.port}"
    document.location.href.replace(document.location.protocol + '//' + document.location.host + port + '/', '')
  
  _get_controller: ->
    return @current_absolute_path[0] if @current_absolute_path.length >= 1
    return null
  
  _get_action: ->
    return @current_absolute_path[2] if @current_absolute_path.length >= 3
    if @current_absolute_path.length >= 2
      return 'new' if @current_absolute_path[1] == 'new'
    return 'index'
  
  _get_param: ->
    return @current_absolute_path[1] if @current_absolute_path.length >= 2
    return null
  
  _set_current: ->
    @current = {controller: null, action: null, param: null}
    @current.controller = @_get_controller()
    @current.action = @_get_action()
    @current.param = @_get_param()
    @current.action = 'show' if @current.action == 'index' && @current.param
  
  _set_params: ->
    @current_absolute_path = @_domain_removed_current_url().split('/')
    @previous = @current if @current
    @_set_current()
  
@TurbolinksSlide = TurbolinksSlide
