class ReleasePlan < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  belongs_to :project
  has_many :iterations
  has_many :user_stories
  
  validates :name, :presence => true
  
  def starts
    if start_date
      start_date.strftime("%b %d, %Y")
    else
      'not defined'
    end
  end
  
  def ends
    if end_date
      end_date.strftime("%b %d, %Y")
    else
      'not defined'
    end
  end
  
  def length
    if iteration_length
      pluralize(iteration_length, 'week')
    else
      'not defined'
    end
  end
  
end
