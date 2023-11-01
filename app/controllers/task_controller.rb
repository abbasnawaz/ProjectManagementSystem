class TaskController < ApplicationController

  require 'securerandom'


  def show_task
    session[:pid] = params[:id]
    # byebug
    @task = Task.where("project_id = ?", params[:id])

  end


  def add_task

  end


  def save_task
    # byebug
    unique_random_integer = SecureRandom.random_number(1_000_000)
    @task = Task.new(description: params[:description],ticketNo: unique_random_integer, task_type: params[:task_type], ending_date: params[:ending_date], priority: params[:priority], project_id: session[:pid])
    if @task.save
      flash[:notice] = "Task saved successfully"
      redirect_to user_project_path(session[:pid])
    else
      # byebug
      flash[:warning] = @task.errors.full_messages.to_sentence
      redirect_to user_project_path(session[:pid])

    end

  end


  def show_edit_task

    @task = Task.find(params[:id])


  end


  def save_edit_task
    @task = Task.find(params[:id])

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
    params.require(:task).permit(:description, :ticketNo, :task_type, :ending_date, :priority)

  end

end
