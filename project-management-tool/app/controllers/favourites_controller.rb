class FavouritesController < ApplicationController
  # before_action :authorize!
  def create
    project = Project.find params[:project_id]
    favourite = Favourite.new(project: project, user: current_user)
    if favourite.save
      flash[:notice] = 'Thanks ...'
    else
      flash[:alert] = favourite.pretty_errors
    end
      redirect_to project_path(project)
  end

  def destroy
    favourite = Favourite.find params[:id]
    if favourite.destroy
      flash[:notice] = '🤒'
    else
      flash[:alert] = favourite.pretty_errors
    end
    redirect_to project_path(favourite.project)
  end
end
