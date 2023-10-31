class ProjectController < ApplicationController


  def index

    @project = Newuser.find(params[:id])
    # @project = user.projects

  end
end
