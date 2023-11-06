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



  private

  def developer_params
    d_params = params.require(:developer).permit(:specilization, :name, :age, :phoneNo, :email)
    d_params[:newuser_id] = current_newuser.id
    d_params
  end





end
