class FreePostsController < ApplicationController

  before_action :set_post, only: [:show,:edit,:update,:destroy]

  def set_post
    @free_posts = FreePost.find(params[:id])
  end

  def index
  @free_posts = FreePost.all
  end

  def show
  end

  def new
    @free_posts = FreePost.new
  end

  def create
    @free_posts = FreePost.new(post_params)
    @free_posts.save
    redirect_to free_posts_path
  end

  def edit
  end

  def update
    @free_posts = FreePost.new(post_params)
  end


  def destroy
    @free_posts.destroy
    redirect_to free_posts_path
  end

  def post_params
    params.require(:free_post).permit(:name,:title,:detail,:updated_at)
  end

end
