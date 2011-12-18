module UserStoriesHelper
  
  def status_list
    if @user_story.status
      "section##{@user_story.status.identification} ul"
    else
      "section#backlog ul"
    end
  end
  
  def user_story_item
    "li#user_story_#{@user_story.id}"
  end
  
end
