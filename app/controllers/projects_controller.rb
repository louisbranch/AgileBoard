class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
    @statuses = Status.all
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
