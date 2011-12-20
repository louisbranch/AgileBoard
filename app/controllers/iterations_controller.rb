class IterationsController < ApplicationController
  before_filter :load_resources
  
  def show
    @iteration = Iteration.find(params[:id])
    @user_stories = @iteration.user_stories
    @user_stories_backlog = @iteration.user_stories.iteration_backlog
    @statuses = Status.all
  end
  	
	def new
	  @iteration = @release_plan.iterations.build
	end
	
	def create
	  @iteration = @release_plan.iterations.build(params[:iteration])
	  if @iteration.save
	    redirect_to project_release_plan_path(@project, @release_plan), :notice => 'Iteration Created!'
	  end
	end
	
	private
	
	def load_resources
	  @project = Project.find(params[:project_id])
	  @release_plan = ReleasePlan.find(params[:release_plan_id])
	end	
	
end
