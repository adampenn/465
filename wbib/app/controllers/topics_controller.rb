class TopicsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_topic,  only: [:show, :edit, :update, :destroy]
  
  def index
    @topic = Topic.all
  end

  def show
  end

  def new 
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = topic.new(topic_params)
    if @topic.save
      redirect_to @topic, notice: 'Topic was updated successfully'
    else 
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end
  
    def topic_params
      params.require(:topic).permit(:title, :description)
    end

end

