class UserStoriesController < ApplicationController
  before_filter :find_project
  
  def new
    @user_story = UserStory.new
  end
  
  def create
    @user_story = @project.user_stories.build(params[:user_story])
    if @user_story.save
      respond_to do |format|
        format.html { redirect_to project_path(@project), :notice => 'User Story Created!'}
        format.js { @user_story }
      end
    end
  end
  
  def edit
    @user_story = UserStory.find(params[:id])
  end
  
  def update
    @user_story = UserStory.find(params[:id])
    if @user_story.update_attributes(params[:user_story])
      respond_to do |format|
        format.html { redirect_to project_path(@project), :notice => 'User Story Updated!'}
        format.js { @user_story }
      end
    end
  end
  
  private
  
  def find_project
    @project = Project.find(params[:project_id])
  end
  
end
