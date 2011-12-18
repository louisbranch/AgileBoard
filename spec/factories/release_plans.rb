FactoryGirl.define do
  factory :release_plan do
    name "Alpha Version"
    description "First version to test some features"
    start_date "2012-11-16"
    end_date "2012-12-16"
    iteration_length 1
    finished false
    association :project
  end
end
