class UserStory < ActiveRecord::Base
  belongs_to :project
  
  validates :name, :presence => true
  validates :project_id, :presence => true
  validates :status, :inclusion => { :in => 0..5 }
  
  scope :backlog,    where(:status => 0)
  scope :todo,       where(:status => 1)
  scope :doing,      where(:status => 2)
  scope :validating, where(:status => 3)
  scope :done,       where(:status => 4)
  scope :archived,   where(:status => 5)
  
  def statuses
    [
      ['Backlog',    0],
      ['To Do',      1],
      ['Doing',      2],
      ['Validating', 3],
      ['Done',       4],
      ['Archived',   5]
    ]
  end  
end
