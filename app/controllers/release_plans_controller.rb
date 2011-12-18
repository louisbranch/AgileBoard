class ReleasePlansController < ApplicationController
  before_filter :find_project
  
  def show
    @release_plan = ReleasePlan.find((params[:id]))
    @iterations = @release_plan.iterations
    @user_stories = @release_plan.user_stories.release_backlog
  end  
  
  def new
    @release_plan = @project.release_plans.build 
  end
  
  def create
    @release_plan = @project.release_plans.build(params[:release_plan])
    if @release_plan.save
      redirect_to @project, :notice => 'Release Plan Created!'
    else
      show_errors(@release_plan)
      redirect_to new_project_release_plan_path(@project)
    end
  end
  
  def edit
    @release_plan = ReleasePlan.find((params[:id]))
  end
  
  def update
    @release_plan = ReleasePlan.find(params[:id])
    if @release_plan.update_attributes(params[:release_plan])
      redirect_to @project, :notice => 'Release Plan Updated!'
    else
      show_errors(@release_plan)
      redirect_to edit_project_release_plan_path(@project, @release_plan)
    end
  end
  
  private
  
  def find_project
    @project = Project.find(params[:project_id])
  end
  
end
