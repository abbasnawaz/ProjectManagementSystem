class TaskController < ApplicationController

  require 'securerandom'


  def show_task
    session[:pid] = params[:id]
    @tasks = Task.where("project_id = ?", params[:id])


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

    # byebug

    @task = Task.find(params[:id])
    @developer = Developer.where(newuser_id: current_newuser.id)
    @selectedDeveloper = @task.developer
    # byebug


  end


  def save_edit_task

    @task = Task.find(params[:id])
    @developer = Developer.where(newuser_id: current_newuser.id)
    # byebug

    if @task.update(task_params)
      flash[:success] = "Task updated"
      redirect_to user_project_path(session[:pid])


    else
      flash[:error] =  @task.errors.full_messages.to_sentences
      redirect_to user_project_path(session[:pid])

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
    params.require(:task).permit(:developer_id, :description, :ticketNo, :task_type, :ending_date, :priority)

  end

  def task_new_params

    t_params = params.require(:task).permit(:description, :task_type, :ending_date, :priority, :developer_id)
    # t_params[:developer_id] = params[:id]
    t_params[:project_id] = session[:pid]
    t_params[:ticketNo] = SecureRandom.random_number(1_000_000)
    # byebug
    t_params

  end

end
