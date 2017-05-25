class Api::V1::BoardController < ApplicationController

  def index
    boards = Board.all
    render json: boards
  end

  def create
    # create new board with the params of name
    # generate 4 random and unique x and y coordiantes for door, player, key, monster
    # loop over that array with 'each' tocreate door, person, key, and monster and associate them with the board
    # save the board
    # return the board as json
  end

  def update
    binding.pry
  end

  def delete
    board = Board.find(name: params[:name])
    board.destroy_all
    render json: board
  end

  def show
    board = Board.find(name: params[:name])
    render json: board
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end

end
