class ProjectsController < ApplicationController
  before_action :authorize!, except: [:index, :show]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project_params = params.require(:project).permit([:title, :description])
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path(@project), notice: "Succesfully Created"
    else
      flash.now[:alert] = "Unable to Created"
      render :new
    end
  end

  def show
  @project = Project.find params[:id]
  # render json: params
end

  def destroy
    @project = Project.find params[:id]
    @project.destroy
    redirect_to projects_path "Project Deleted"
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    project_params = params.require('project').permit(:title, :description)

    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Succesfully Updated"
    else
      flash.now[:alert] = "Unable to Updated"
      render :edit
    end
  end
end
