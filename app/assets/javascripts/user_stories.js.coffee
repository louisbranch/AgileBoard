filterIterations = ->
  $('#user_story_iteration_id').parent().hide()
  iterations = $('#user_story_iteration_id').html()
  $('#user_story_release_plan_id').change ->
    release_plan = $('#user_story_release_plan_id :selected').text()
    escaped_release_plan = release_plan.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(iterations).filter("optgroup[label='#{escaped_release_plan}']").html()
    if options
      $('#user_story_iteration_id').html(options)
      $('#user_story_iteration_id').parent().show()
    else
      $('#user_story_iteration_id').empty()
      $('#user_story_iteration_id').parent().hide()

filterStatus = ->
  $('#user_story_status_id').parent().hide()
  $('#user_story_release_plan_id').change ->
    if $('#user_story_release_plan_id').val()
      $('#user_story_status_id').parent().show()
    else
      $('#user_story_status_id').parent().hide()

filterPriority = ->
  $('#user_story_priority_id').parent().hide()
  $('#user_story_release_plan_id').change ->
    if $('#user_story_release_plan_id').val()
      $('#user_story_priority_id').parent().show()
    else
      $('#user_story_priority_id').parent().hide()

$ window.userStoryForm = ->
  if $('form.new_user_story, form.edit_user_story').length
    filterIterations()
    filterStatus()
    filterPriority()
