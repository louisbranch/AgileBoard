class Iteration < ActiveRecord::Base
  belongs_to :release_plan
  has_many :user_stories
  
  def name
    index = release_plan.iterations.index(self)
    "#{(index + 1).ordinalize} Iteration"
  end
end
