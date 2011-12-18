FactoryGirl.define do
  factory :iteration do
    length 1
    finished false
    association :release_plan
  end
end
