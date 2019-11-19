class BoardsController < ApplicationController

	def index
		@boards = Board.all
		@board = Board.new
        @categories = Category.all
	end

	def new
		@board = Board.new
		@category = Category.new
	end

    def show
    	@board = Board.find(params[:id])
    	@comments = @board.comments
        @comment = Comment.new
    end

    def create
    	@board = Board.new(board_params)
        p @board
        @board.user_id = current_user.id
		  if @board.save
             redirect_to boards_path
          else 
            @boards=Board.all
            render :index
          end           
    end

    private
    def board_params
    	params.require(:board).permit(:thread_title, :category_id)
    end
end