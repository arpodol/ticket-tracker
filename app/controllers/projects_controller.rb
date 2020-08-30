class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]

  def index;end

  def show;end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    #@project.creator = current_user TODO!

    if @project.save
      flash[:notice] = "Your project was created."
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit;end

  def update
    if @project.update(project_params)
      flash[:notice] = "This project was updated."
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "The project was successfully deleted."
    redirect_to projects_url
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
