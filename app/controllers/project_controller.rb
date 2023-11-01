class ProjectController < ApplicationController

  before_action :authenticate_newuser!

  def index
    @project = Project.where("newuser_id = ?", current_newuser.id.to_s)
  end


  def create

  end

  def AddProject


    # @user = Newuser.find_by_email(current_user.email)
    # @project = Project.new(project_name: params[:name],: params[:], : current_user.id)

    puts "The ID is: "+current_newuser.id.to_s
    new_project = Project.new(project_name: params[:project_name], starting_date: params[:starting_date], ending_date: params[:ending_date], newuser_id: current_newuser.id)
    # byebug
    if new_project.save()
      redirect_to root_path
    else
      # byebug
      flash[:warning] = "Error While Saving Project"
      redirect_to root_path
    end




    # puts params
  end


  def update_user_project

    @project = Project.find(params[:id])

  end

  def save_user_project

    @project = Project.find(params[:id])

    if @project.update(user_params)
      flash[:success] = "Project updated"
      redirect_to root_path

    else
      flash[:error] =  @user.errors.full_messages
      render :update_user_project

    end

  end


  def delete_user_project
    @project = Project.find(params[:id])
    if @project.delete
      flash[:notice] = "Project deleted successfully"
      redirect_to root_path
    end
  end



  private
  def user_params
    params.require(:project).permit(:project_name, :starting_date, :ending_date)

  end





end
