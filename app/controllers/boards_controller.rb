class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_board, only: %i[ show edit update destroy ]

  # GET /boards
  def index
    @boards = Board.all
  end

  # GET /boards/1
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
    authorize set_board
  end

  # POST /boards
  def create
    @board = Board.new(board_params.merge(user: current_user))

    if @board.save
      redirect_to @board, notice: "Board was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    authorize set_board
    if @board.update(board_params)
      redirect_to boards_path, notice: "Board was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    authorize set_board
    @board.destroy
    redirect_to boards_url, notice: "Board was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:name)
    end
end
