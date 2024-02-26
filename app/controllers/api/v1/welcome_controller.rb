# frozen_string_literal: true

# Controller for handling API v1 welcome
module Api
  module V1
    # Controller for handling welcome
    class WelcomeController < ActionController::API
      def index
        @posts = Post.all.limit(10).order('created_at desc')
        @projects = Project.all.limit(10).order('created_at desc')
        render json: { posts: @posts, projects: @projects }
      end
    end
  end
end
