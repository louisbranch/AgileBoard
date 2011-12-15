class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
    @backlog = @project.user_stories.backlog
    @todo = @project.user_stories.todo
    @doing = @project.user_stories.doing
    @validating = @project.user_stories.validating
    @done = @project.user_stories.done
    @archived = @project.user_stories.archived
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Project Created!'
      redirect_to projects_path
    end
  end

end
