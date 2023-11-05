class DeveloperController < ApplicationController

  def show

    @developer = Developer.where(newuser_id: current_newuser.id)



  end

  def create

  end

  def save_developer


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
    params.require(:developer).permit(:specilization, :name, :age, :phoneNo, :email, :newuser_id)
  end





end
