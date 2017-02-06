class FreePostsController < ApplicationController

  before_action :set_post, only: [:show,:edit,:update,:destroy]

  def set_post
    @free_posts = FreePost.find(params[:id])
  end

  def index
  @free_posts = FreePost.all
  @post_operator = PostOperator.find_by(params[:status])
  end

  def show
  end

  def new
    @free_posts = FreePost.new
  end

  def create
    @free_posts = FreePost.new(post_params)
    @free_posts.save

    if @free_posts.save
      #redirect_to notification_index_url(@free_posts.urgency)
      redirect_to :controller=>'notification', :action=>'index',:post_name=>@free_posts.name, :post_title=>@free_posts.title
      #redirect_to root_path
    else
      render :new
    end

  end








  def edit
  end

  def update
    if @free_posts.update(post_params)
      redirect_to @free_posts
    else
      render :edit
    end
  end


  def destroy
    @free_posts.destroy
    redirect_to free_posts_path
  end

  def post_params
    params.require(:free_post).permit(:name,:title,:detail,:updated_at,
    post_operator_attributes: [
      :id,
      :status, :name, :memo,:free_post_id
    ])
  end

  def operator_params
    params.require(:post_operator).permit(:id,:status,:name, :memo)
  end

end
