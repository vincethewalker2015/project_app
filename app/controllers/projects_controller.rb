class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
    flash[:success] = "Project sucessfully created"
    redirect_to project_path(@project)
    else
    render 'new'
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
   
    if @project.update(project_params)
      flash[:success] = "Project has been updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end
  
  def index
    @projects = Project.all
  end
  
  def destroy
   
    if @project.destroy
       flash[:danger] = "Project has been Deleted"
       redirect_to projects_path
    else
        flash[:danger] = "Something didnt work.."
        redirect_to projects_path
    end
    
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description)
  end
  
  def set_project
    @project = Project.find(params[:id])
  end
  
  def require_same_user
    if current_user != @project.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own Projects"
      redirect_to projects_path
    end
  end
  
end