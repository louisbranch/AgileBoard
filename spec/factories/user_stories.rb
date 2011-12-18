FactoryGirl.define do
  factory :user_story do
    name 'Creating an User Story'
    description 'In order to describe a new feature for a project...'
    association :project
    
    factory :user_story_with_release_plan do
      association :story_point
      association :release_plan
      association :priority
    end
    
    factory :user_story_with_iteration do
      association :story_point
      association :release_plan
      association :priority
      association :iteration
    end
    
    factory :user_story_with_status do
      association :story_point
      association :release_plan
      association :priority
      association :iteration
      association :status
    end
    
    factory :user_story_with_story_point do
      association :story_point
    end
    
  end
end
