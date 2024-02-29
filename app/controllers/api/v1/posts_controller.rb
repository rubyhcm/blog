# frozen_string_literal: true

# Controller for handling API v1 projects
module Api
  module V1
    # Controller for handling projects
    class PostsController < ActionController::API
      before_action :find_post, only: [:show, :update, :destroy]
      before_action :authenticate_user!, except: [:index, :show]
      before_action :authorize_admin, only: [:update, :destroy]

      def index
        posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 5)
        render json: posts
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: post, status: :created
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def show
        render json: @post
      end

      def update
        if @post.update(post_params)
          render json: @post, status: :ok
        else
          render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @post.destroy
        head :no_content
      end

      private

      def post_params
        params.require(:post).permit(:title, :content, :slug)
      end

      def find_post
        @post = Post.friendly.find_by(slug: params[:id])
        head :not_found unless @post
      end
    end
  end
end
