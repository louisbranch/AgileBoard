class UserStoriesController < ApplicationController
  before_filter :find_project
  
  def new
    @user_story = UserStory.new
  end
  
  def create
    @user_story = @project.user_stories.build(params[:user_story])
    if @user_story.save
      flash[:notice] = 'User Story Created!'
      redirect_to project_path(@project)
    end
  end
  
  def edit
    @user_story = UserStory.find(params[:id])
  end
  
  def update
    @user_story = UserStory.find(params[:id])
    if @user_story.update_attributes(params[:user_story])
      flash[:notice] = 'User Story Updated!'
      redirect_to project_path(@project)
    end
  end
  
  def change_status
    @user_story = UserStory.find(params[:id])
    if @user_story.update_attributes(params[:user_story])
    end
    render nothing: true
  end
  
  private
  
  def find_project
    @project = Project.find(params[:project_id])
  end
  
end
