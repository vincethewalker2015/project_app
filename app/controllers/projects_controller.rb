class ProjectsController < ApplicationController
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
    flash[:notice] = "Project sucessfully created"
    redirect_to project_path(@project)
    else
    render 'new'
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project has been updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  
  def index
    @projects = Project.all
  end
  
  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
       flash[:notice] = "Project has been Deleted"
       redirect_to projects_path
    else
        flash[:notice] = "Something didnt work.."
        redirect_to projects_path
    end
    
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description)
  end
  
end