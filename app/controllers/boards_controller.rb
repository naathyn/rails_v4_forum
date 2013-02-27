class BoardsController < ApplicationController
  before_action :set_board, only: :show

  def show
  end

private

  def set_board
    @board = Board.find(params[:id])
    @topics = @board.topics.page(page_params)
  end

  def page_params
    params[:page]
  end
end
