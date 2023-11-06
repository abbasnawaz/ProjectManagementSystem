class ProjectController < ApplicationController

  before_action :authenticate_newuser!

  def index
    # @project = Project.where("newuser_id = ?", current_newuser.id.to_s)
    @projects = current_newuser.projects
    # byebug
  end
  def create
    @project = Project.new
    # byebug
  end

  def save_project
    # byebug
    @project = Project.new(project_params)
    if @project.save()
      redirect_to root_path
    else
      flash[:warning] = @project.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end


  def update_user_project

    @project = find_project()


  end

  def save_user_project


    @project = find_project()

    if @project.update(user_params)
      flash[:success] = "Project updated"
      redirect_to root_path

    else
      flash[:error] =  @user.errors.full_messages
      render :update_user_project

    end

  end


  def delete_user_project
    @project = find_project()
    @project.tasks.destroy_all
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
    # byebug
    p_params = params.require(:project).permit(:project_name, :starting_date, :ending_date, :newuser_id)
    p_params[:newuser_id] = current_newuser.id
    p_params
    # byebug
  end

  def find_project
    Project.find(params[:id])

  end





end
