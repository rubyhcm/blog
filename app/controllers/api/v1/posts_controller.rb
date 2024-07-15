# frozen_string_literal: true

# done

# Controller for handling API v1 projects
module Api
  module V1
    # Controller for handling API v1 posts
    class PostsController < BaseController
      before_action :find_post, only: %i[show update destroy]
      # before_action :authenticate_user!, except: [:index, :show]
      # before_action :authorize_admin, only: [:update, :destroy]

      def index
        posts = Post.all.order('created_at desc')
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
        params.require(:post).permit(:title, :content)
      end

      def find_post
        @post = Post.find_by(id: params[:id])
        render json: { errors: 'Post not found' }, status: :not_found unless @post
      end
    end
  end
end
