class Admin::BoardsController < ApplicationController
   
    before_action :login_check, only: [:destroy]

	def index
		@boards = Board.order(created_at: :desc)
        @categories = Category.all
        @q = Board.ransack(params[:q])
        @boards = @q.result(distinct: true)
	end

    def search
      if params[:q]
        @q = Board.ransack(search_params)
        @boards = @q.result(distinct: true)
        @categories = Category.all
        render "index"
      end
    end

    def new
    	@board = Board.new
    	@category = Category.new
    end

    def createc
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
    
    def search_params
        params.require(:q).permit!
    end
end
