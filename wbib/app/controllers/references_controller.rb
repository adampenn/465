class ReferencesController < ApplicationController
  before_action :set_reference, only: [:edit, :update, :destroy]
  def index
    @topic = Topic.find params[:topic_id]
    @references = @topic.references
  end
  
  def new
    @topic = Topic.find params[:topic_id]
    @reference = @topic.references.new
  end
  
  def edit
  end
  
  def create
    @topic = Topic.find params[:topic_id]
    @reference = @topic.references.new(reference_params)
    if @reference.save
      redirect_to topic_references_url(@topic), notice: 'Reference created'
    else
      render :new
    end
  end

  def update
    if @reference.update(reference_params)
      redirect_to topic_references_url(@reference.topic), notice: 'Reference Updated'
    else
      render :edit
    end
  end

  def destroy
    @reference.destroy
    redirect_to professor_references_utl(@reference.topic), notice: 'Reference deleted'
  end

  private
    def set_reference
      @reference = Reference.find(params[:id])
    end

    def reference_params
      params.require(:reference).permit(:URL, :time)
    end
  
end
