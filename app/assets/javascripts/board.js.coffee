$ dragUserStories = ->
  if $('ul.drag_user_stories').length
    $('ul.drag_user_stories').sortable
      scroll: false,
      connectWith: 'ul.drag_user_stories',
      placeholder: 'user_stories placeholder',
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
    $('section#backlog').hide()
    $('section#.handler').show()
    $('section#.handler').click ->
      showSecundarySections()

showSecundarySections = ->
  $('section#todo, section#doing, section#validating, section#done').removeClass('expanded')
  $('section#backlog').show()
  $('section#.handler').hide()
  $('section#backlog h3').click ->
    hideSecundarySections()
