$ selectReleasePlanDates = ->
  if $('form.new_release_plan, form.edit_release_plan').length
    $('input#release_plan_start_date, input#release_plan_end_date').datepicker()
