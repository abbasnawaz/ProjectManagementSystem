class UserController < ApplicationController

  def index
    # @user = all


  end

  def addUser





  end

  def SaveUser
    # if request.method == "POST"
    # render html: params

    puts "Working: "+params[:name]
      user1 = User.new(username: params[:name], email: params[:email], password: params[:password], f_name: params[:f_name], l_name: params[:l_name], orginization_name: params[:organization])
      if user1.save()
        redirect_to root_path
      end
      # puts "Printing check: "+check.to_s

    # end
  end


  def DeleteUser
    userData = User.find(params[:id])
    # userData = User.destory(params[:id])
    if userData.delete
      flash[:notice] = "The User Deleted"
      redirect_to root_path
    end
  end


  def EditUser
    @user = User.find(params[:id])
  end

  def UpdateUser


    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "User updated"
      redirect_to root_path

    else
      flash[:error] =  @user.errors.full_messages
      render :EditUser

    end

  end



  private
  def user_params
    params.require(:user).permit(:username, :email, :f_name, :l_name, :organization)

  end

end
