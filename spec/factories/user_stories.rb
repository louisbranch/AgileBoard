FactoryGirl.define do
  factory :user_story do
    name "Creating an User Story"
    description   """
	  In order to describe a new feature for a project
    As a Product Owner
    I want to create an User Story
    """
    association :project
    association :status
    association :story_point
  end
end
