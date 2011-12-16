class Status < ActiveRecord::Base
  has_many :user_stories
  
  def identification
    name.gsub(' ','').downcase
  end
  
end
