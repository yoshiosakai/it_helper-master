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
    @post_operator = PostOperator.find(params[:id])
  end

  def update
    @post_operator = PostOperator.find(params[:id])
    respond_to do |format|
puts "3"
      if @post_operator.update(operator_params)
        format.html{redirect_to free_post_path, notice: '内容が更新されました'}
        format.json{head :no_content}
      else
puts "7"
        format.html{render action:'edit'}
        format.json{render action:@post_operator.errors,status: :unprocessable_entry}
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

  def operator_params
    params.require(:post_operator).permit(:id,:free_post_id,:status,:name, :memo)
  end

end
