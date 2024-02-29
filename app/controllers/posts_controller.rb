class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_admin, only: [:update, :destroy]

  def index
    @posts = Post.all.order('created_at desc').paginate(page: params[:page], per_page: 5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post, notice: "Your post has been saved!"
    else
      render 'new', notice: "Your post has not been saved!"
    end
  end

  def show
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Your post has been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
    @post = Post.friendly.find_by(slug: params[:id])
    # Post.friendly.find(params[:id])
  end

end
