class TopicsController < ApplicationController

  def index
    @topics = Topic.all.includes(:favorite_users)
  end
  def show
    @topic = Topic.find(params[:id])
  end
  def new
    @topic = Topic.new
    @categories = Category.all
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  def edit
    @topic = Topic.find(params[:id])
  end
  def update
    @topic = Topic.find(params[:id])
    @topic.image = params[:topic][:image]
    @topic.description = params[:topic][:description]
    @topic.category = params[:topic][:category_id]
    @topic.material = params[:topic][:material]
    @topic.recipe = params[:topic][:recipe]
    @topic.save
    redirect_to current_user
  end
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to current_user
  end
  private
  def topic_params
    params.require(:topic).permit(:image, :description, :category_id, :material, :recipe)
  end
end
