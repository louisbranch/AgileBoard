class UserStoriesController < ApplicationController
  before_filter :find_project
  before_filter :form_instances, :only => [:new, :edit]
  
  def new
    @user_story = UserStory.new
    @release_plans = ReleasePlan.all
    @statuses = Status.all
    @story_points = StoryPoint.all
  end
  
  def create
    @user_story = @project.user_stories.build(params[:user_story])
    if @user_story.save
      respond_to do |format|
        format.html { redirect_to @project, :notice => 'User Story Created!'}
        format.js { @user_story }
      end
    else
      show_errors(@user_story)
      redirect_to @project
    end
  end
  
  def edit
    @user_story = UserStory.find(params[:id])
  end
  
  def update
    @user_story = UserStory.find(params[:id])
    if @user_story.update_attributes(params[:user_story])
      respond_to do |format|
        format.html { redirect_to @project, :notice => 'User Story Updated!'}
        format.js { @user_story }
      end
    else
      show_errors(@user_story)
      redirect_to @project
    end
  end
  
  def update_status
    status = params[:status]
    params[:user_story].each_with_index do |id|
      UserStory.update_all({status_id: status},{id: id})
    end
    render nothing: true
  end
  
  private
  
  def find_project
    @project = Project.find(params[:project_id])
  end
  
  def form_instances
    @release_plans = Project.find(params[:project_id]).release_plans
    @statuses = Status.all
    @story_points = StoryPoint.all
    @priorities = Priority.all
  end
  
end
