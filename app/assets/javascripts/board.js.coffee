$ sortUserStories = ->
  if $('div#board').length
    $('div#board section ul').sortable
      scroll: false,
      connectWith: 'div#board section ul',
      placeholder: 'placeholder',
      handle: 'header',
      opacity: 0.9,
      over: ->
        $(this).parent().addClass('active')
      out: ->
        $(this).parent().removeClass('active')
      update: ->
        #$.post($(this).data('update-url'))

$ hideSecundarySections = ->
  if $('div#board').length
    $('section#backlog, section#archived').addClass('hidden').click ->
      showSecundarySections()
    $('section#todo, section#doing, section#validating, section#done').addClass('expanded')

showSecundarySections = ->
  $('section#backlog, section#archived').removeClass('hidden').click ->
    hideSecundarySections()
  $('section#todo, section#doing, section#validating, section#done').removeClass('expanded')
