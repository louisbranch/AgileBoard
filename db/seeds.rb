# encoding: UTF-8
Status.create([
  { :name => 'To Do' },
  { :name => 'Doing' },
  { :name => 'Validating'},
  { :name => 'Done'}
  ])
  
StoryPoint.create([
  { :value => '½' },
  { :value => '1' },
  { :value => '2'},
  { :value => '3'},
  { :value => '5'},
  { :value => '8'},
  { :value => '13'},
  { :value => '21'},
  { :value => '34'}
  ])

Priority.create([
  { :name => 'Must Have' },
  { :name => 'Should Have' },
  { :name => 'Could Have' },
  #{ :name => 'Won\'t Have this Time' },
  ])
