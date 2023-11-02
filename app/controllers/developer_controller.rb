class DeveloperController < ApplicationController

  def show_developer

    @developer = Developer.where(newuser_id: current_newuser.id)



  end

  def create_developer

  end

  def save_developer


    @developer = Developer.new(specilization: params[:specilization], name: params[:name], age: params[:age], phoneNo: params[:phoneNo], email: params[:email], newuser_id: current_newuser.id )
    if @developer.save()
      flash[:notice] = "Developer saved successfully"
      redirect_to user_developer_path
    else
      flash[:error] = @developer.errors.full_messages.to_sentence
      redirect_to user_developer_path
    end


  end

  def update_developer

  end

  def save_update_developer

  end

  def delete_developer

  end





end
