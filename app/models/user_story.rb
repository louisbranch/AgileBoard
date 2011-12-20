class UserStory < ActiveRecord::Base
  before_validation :nullify_data
  
  belongs_to :project
  belongs_to :release_plan
  belongs_to :iteration
  belongs_to :status
  belongs_to :story_point
  belongs_to :priority
  
  validates :name,         :presence => true
  validates :project_id,   :presence => true
  validates :release_plan, :presence => true, :if => :priority
  validates :release_plan, :presence => true, :if => :iteration
  validates :priority,     :presence => true, :if => :release_plan
  validates :iteration,    :presence => true, :if => :status
  validates :story_point,  :presence => true, :if => :release_plan
  
  scope :project_backlog, where(:status_id => nil, :release_plan_id => nil)
  scope :release_backlog, where(:status_id => nil, :iteration_id => nil)
  scope :iteration_backlog, where(:status_id => nil)
  scope :by_priority, lambda { |priority| where("priority_id = ?", priority)}
  scope :by_status, lambda { |status| where("status_id = ?", status)}
  
  def points
    if story_point
      story_point.value
    else
      '?'
    end
  end
  
  def threat_color_class
    if priority
      "user_stories #{priority.name.downcase.gsub!(" ", "_")}"
    else
      "user_stories"
    end
  end
  
  private
  
  def nullify_data
    unless release_plan_id
      self.priority_id = nil
      self.iteration_id = nil
      self.status_id = nil
    end
  end
end
