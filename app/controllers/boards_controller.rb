class BoardsController < ApplicationController
  before_action :set_board, only: :show

  def show
    @topics = @board.topics.page(params[:page])
  end

private

  def set_board
    @board = Board.find(params[:id])
  end
end
