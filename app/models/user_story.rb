class UserStory < ActiveRecord::Base
  belongs_to :project
  belongs_to :status
  belongs_to :story_point
  
  validates :name, :presence => true
  validates :project_id, :presence => true
  validates :status_id, :presence => true
  
end
