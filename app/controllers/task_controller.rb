class TaskController < ApplicationController

  # skip_before_action :verify_authenticity_token
  require 'securerandom'


  def show_task
    @q = Task.ransack(params[:id])
    @tasks = @q.result(distinct: true).order(priority: :desc).where(project_id: params[:id])
    session[:pid] = params[:id]
  end


  def add_task
    @task = Task.new
    @developer = Developer.where(newuser_id: current_newuser.id)
  end



  def save_task
    @task = Task.new(task_new_params)

    if @task.save
      flash[:notice] = "Task saved successfully"
      redirect_to user_project_path(session[:pid])
    else
      flash[:warning] = @task.errors.full_messages.to_sentence
      redirect_to user_project_path(session[:pid])

    end

  end


  def show_edit_task
    @task = Task.find(params[:id])
    @developer = Developer.where(newuser_id: current_newuser.id)
    @selectedDeveloper = @task.developer
  end


  def save_edit_task
    @task = Task.find(params[:id])
    @developer = Developer.where(newuser_id: current_newuser.id)
    # byebug
    if @task.update(task_params)
      flash[:success] = "Task priority was successfully updated."
      respond_to do |format|
        format.html { redirect_to user_project_path(session[:pid]), notice: 'Task priority was successfully updated.' }
        format.json { render json: { success: true, message: 'Task priority updated successfully', priority: @task.priority } }
      end
    else
      flash[:error] =  @task.errors.full_messages.to_sentence
      respond_to do |format|
        format.html { redirect_to user_project_path(session[:pid]) }
        format.json { render json: { success: false, errors: @task.errors.full_messages } }
      end
    end
  end


  def delete_task

    task_data = Task.find(params[:id])
    if task_data.delete
      flash[:notice] = "Task deleted successfully"
      redirect_to user_project_path(session[:pid])
    end
  end

  private
  def task_params
    # byebug
    params.require(:task).permit(:developer_id, :description, :ticketNo, :task_type, :ending_date, :priority)
  end

  def task_new_params
    t_params = params.require(:task).permit(:description, :task_type, :ending_date, :priority, :developer_id)
    t_params[:project_id] = session[:pid]
    t_params[:ticketNo] = SecureRandom.random_number(1_000_000)
    t_params
  end
end
