class ReleasePlan < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  belongs_to :project
  has_many :iterations
  has_many :user_stories
  
  validates :name, :presence => true
  
  def starts
    if start_date
      start_date.strftime("%b %d, %Y")
    end
  end
  
  def ends
    if end_date
      end_date.strftime("%b %d, %Y")
    end
  end
  
  def duration
    if start_date && end_date
      "#{starts} to #{ends}"
    end
  end
  
  def total_days
    if start_date && end_date
      date = ((start_date)..(end_date)).select {|d| (1..5).include?(d.wday) }.size
      "#{date} days"
    end
  end
  
  def days_left
    if start_date && (Date.today >= start_date) && end_date && !finished
      date = ((Date.today)..(end_date)).select {|d| (1..5).include?(d.wday) }.size
      "#{date} days"
    end
  end
  
end
