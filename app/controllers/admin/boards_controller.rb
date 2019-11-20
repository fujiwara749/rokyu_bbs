class Admin::BoardsController < ApplicationController
   
    before_action :login_check, only: [:destroy]

	def index
		@boards = Board.all
        @categories = Category.all
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

    def login_check
        unless admin_signed_in?
            flash[:alert] = "スレッド削除にはログインが必要です。"
            redirect_to admin_top_path
        end
    end

	private
	def board_params
	    params.require(:board).permit(:thread_title, :category_id)
    end
end
