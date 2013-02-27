class TopicsController < ApplicationController
  before_filter :signed_in_user
  before_action :set_board, only: [:show, :create, :destroy]
  before_filter :increment_view_count!, only: :show

  def show
    @topic = @board.topics.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @topic.board_id = @board.id
    if @topic.save
      redirect_to topic_path([@board, :topics, @topic]), notice: "Your topic has been saved."
    else
      render :new
    end
  end

  def destroy
    @topic = current_user.topics.find(params[:id])
    @topic.destroy
    redirect_to @board, notice: "Your topic was removed"
  end

private

  def set_board
    @board = Board.find(board_params)
  end

  def topic_params
    params.require(:topic).permit(
      :content,
      :title,
      :views,
      :board_id
    )
  end

  def board_params
    params[:board_id]
  end

protected

  def increment_view_count!
    @topic = @board.topics.find(params[:id])
    Topic.record_timestamps = false
    @topic.increment!(:views)
  end
end
