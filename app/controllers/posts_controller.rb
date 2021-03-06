class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :new, :update]
  after_action :verify_authorized
  def index
    # @posts = Post.all
    # authorize @posts
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
      authorize @posts
    else
      @posts = Post.all
      authorize @posts
    end
  end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Post was successfully deleted.' }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
      authorize @post
    end

    def post_params
      params.require(:post).permit(:title, :body, :tag_list)
    end
end
