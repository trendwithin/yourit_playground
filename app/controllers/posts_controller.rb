class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :new]
  after_action :verify_authorized
  def index
    @posts = Post.all
    authorize @posts
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
    authorize @post
  end

  def create
    @post = current_user.posts.build(post_params)
    p @post
    authorize @post
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
