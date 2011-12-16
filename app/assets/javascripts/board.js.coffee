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
        $.post($(this).data('update-url'), $(this).sortable('serialize'))

$ hideSecundarySections = ->
  if $('div#board').length
    $('section#todo, section#doing, section#validating, section#done').addClass('expanded')
    $('section#backlog, section#archived').hide()
    $('section#.handler').show()
    $('section#.handler').click ->
      showSecundarySections()

showSecundarySections = ->
  $('section#todo, section#doing, section#validating, section#done').removeClass('expanded')
  $('section#backlog, section#archived').show()
  $('section#.handler').hide()
  $('section#backlog h3, section#archived h3').click ->
    hideSecundarySections()
