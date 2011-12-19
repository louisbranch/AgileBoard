class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
    @user_stories = @project.user_stories.project_backlog
    @release_plans = @project.release_plans
    @priorities = Priority.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Project Created!'
      redirect_to project_path(@project)
    end
  end

end
