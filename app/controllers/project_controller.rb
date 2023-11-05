class ProjectController < ApplicationController

  before_action :authenticate_newuser!

  def index
    @project = Project.where("newuser_id = ?", current_newuser.id.to_s)
  end


  def new

  end

  def create
    new_project = Project.new()
    if new_project.save()
      redirect_to root_path
    else
      flash[:warning] = "Error While Saving Project"
      redirect_to root_path
    end
  end


  def update_user_project

    @project = find_project(params[:id])


  end

  def save_user_project


    @project = find_project(params[:id])

    if @project.update(user_params)
      flash[:success] = "Project updated"
      redirect_to root_path

    else
      flash[:error] =  @user.errors.full_messages
      render :update_user_project

    end

  end


  def delete_user_project
    @project = find_project(params[:id])
    if @project.delete
      flash[:notice] = "Project deleted successfully"
      redirect_to root_path
    end
  end



  private
  def user_params
    params.require(:project).permit(:project_name, :starting_date, :ending_date)

  end

  def project_params
    params.require(:project).permit(:project_name, :starting_date, :ending_date, :newuser_id)
  end

  def find_project(project_id)
    Project.find(project_id)
  end





end
