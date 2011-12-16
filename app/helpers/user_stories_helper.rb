module UserStoriesHelper
  
  def status_list
    "section##{@user_story.status.identification} ul"
  end
  
  def user_story_item
    "li#user_story_#{@user_story.id}"
  end
  
end
