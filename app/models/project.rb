class Project < ActiveRecord::Base
  has_many :user_stories
  has_many :release_plans
end
