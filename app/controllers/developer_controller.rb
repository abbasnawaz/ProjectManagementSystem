class DeveloperController < ApplicationController

  def show
    @developer = Developer.where(newuser_id: current_newuser.id)
  end

  def create
    @developer = Developer.new
  end

  def save_developer
    # byebug
    @developer = Developer.new(developer_params)
    if @developer.save()
      flash[:notice] = "Developer saved successfully"
      redirect_to user_developer_path
    else
      flash[:error] = @developer.errors.full_messages.to_sentence
      redirect_to user_developer_path
    end
  end

  def edit
    @developer = find_developer()

  end

  def update
    @developer = find_developer()
    if @developer.update(update_params)
      flash[:notice] = "Developer updated successfully"
      redirect_to user_developer_path
    else
      flash[:error] = @developer.errors.full_messages.to_sentence
      redirect_to user_developer_path
    end
  end

  def destory

    @developer = find_developer()
    if @developer.delete
      flash[:success] = "Developer successfully deleted"
      redirect_to user_developer_path
    else
      flash[:error] = @developer.errors.full_messages.to_sentencex
      redirect_to user_developer_path
    end

  end





  private

  def developer_params
    d_params = params.require(:developer).permit(:specilization, :name, :age, :phoneNo, :email)
    d_params[:newuser_id] = current_newuser.id
    d_params
  end

  def update_params
    params.require(:developer).permit(:specilization, :name, :age, :phoneNo, :email)
  end

  def find_developer
    Developer.find(params[:id])
  end





end
