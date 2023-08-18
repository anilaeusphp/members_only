class PostsController < ApplicationController
  before_action :set_post, only: %w[]
  before_action :authenticate_user!, except: %w[index]
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.order(created_at: :asc)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
