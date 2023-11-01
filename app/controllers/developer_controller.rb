class DeveloperController < ApplicationController

  def show_developer

    @developer = Developer.find_by(newuser_id: current_newuser.id)



  end

  def create_developer

  end

  def save_developer

  end

  def update_developer

  end

  def save_update_developer

  end

  def delete_developer

  end

end
