class Api::V1::BoardsController < ApplicationController

  def index
    boards = Board.all
    render json: boards
  end

  def create
    random_coords = generate_random_coords(board_params[:size].to_i, 4)
    board = Board.create(name: board_params[:name], size: board_params[:size])
    player = Player.create(x: random_coords[0][0], y: random_coords[0][1], hearts: 1, board: board)
    key = Key.create(x: random_coords[1][0], y: random_coords[1][1], board: board)
    door = Door.create(x: random_coords[2][0], y: random_coords[2][1], board: board)
    monster = Monster.create(x: random_coords[3][0], y: random_coords[3][1], board: board)
    render json: board
  end

  def update
    binding.pry
  end

  def delete
    board = Board.find(name: params[:id])
    board.destroy_all
    render json: board
  end

  def show
    board = Board.find_by(name: params[:id])
    render json: board
  end

  private

  def board_params
    params.require(:board).permit(:name, :size)
  end

  def generate_random_coords(grid_size, number_of_coords)
    x = ((1..grid_size).to_a * grid_size).sort()
    y = ((1..grid_size).to_a * grid_size)
    coords = x.each_with_index.map do |c, i|
      [c, y[i]]
    end
    coords.sample(number_of_coords)
  end

end
