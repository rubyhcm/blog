class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy, :edit]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all.order('created_at desc')
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to @project, notice: "Your project has been saved!"
    else
      render 'new', notice: "Your project has not been saved!"
    end
  end

  def show
  end

  def update
    if @project.update post_params
      redirect_to @project, notice: "Your project has been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def edit
    # code here
  end

  private
  def find_project
    @project = Project.friendly.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:title, :description, :link, :slug)
  end
end
