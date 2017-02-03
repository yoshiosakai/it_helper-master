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
    respond_to do |format|
      if @free_posts.update(post_params)
        format.html{redirect_to @free_posts, notice: '内容が更新されました'}
        format.json{head :no_content}
      else
        format.html{render action:'edit'}
        format.json{render action:@free_posts.errors,status: :unprocessable_entry}
      end
    end
  end


  def destroy
    @free_posts.destroy
    redirect_to free_posts_path
  end

  def post_params
    params.require(:free_post).permit(:name,:title,:detail,:updated_at)
  end

end
