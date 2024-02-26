# frozen_string_literal: true

# Controller for handling API v1 projects
module Api
  module V1
    # Controller for handling projects
    class ProjectsController < ActionController::API
      before_action :find_project, only: %i[show update destroy edit]
      before_action :authenticate_user!, except: %i[index show]
      before_action :authorize_admin, only: %i[edit update destroy]

      def index
        projects = Project.all.order(created_at: :desc)
        render json: projects
      end

      def create
        project = Project.new(project_params)
        if project.save
          render json: @project, status: :created
        else
          render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @project
      end

      def update
        if @project.update(project_params)
          render json: @project
        else
          render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @project.destroy
        head :no_content
      end

      private

      def find_project
        @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Project not found' }, status: :not_found
      end

      def project_params
        params.require(:project).permit(:title, :description, :link, :slug)
      end
    end
  end
end
