class Admin::BoardsController < ApplicationController

	def index
		@boards = Board.all
	end

    def new
    	@board = Board.new
    	@category = Category.new
    end

    def create
    	@board = Board.new(board_params)
        @board.save
   		redirect_to admin_boards_path
    end

    def show
        @board = Board.find(params[:id])
    end

    def destroy
    	@board = Board.find(params[:id])
    	@board.destroy
    	redirect_to admin_boards_path
    end

	private
	def board_params
	    params.require(:board).permit(:thread_title, :category_id)
    end
end
