class Admin::BoardsController < ApplicationController
   
    before_action :login_check, only: [:destroy]

	def index
        @q = Board.ransack(params[:q])
        if params[:q].present?
            @boards = @q.result(distinct: true).page(params[:page]).per(15)
        else
            @boards = Board.all.order(created_at: :desc)
            @boards = @boards.page(params[:page]).per(15)
        end
        @categories = Category.all
	end

    def search
      if params[:q]
        @q = Board.ransack(search_params)
        @boards = @q.result(distinct: true)
        @boards = @boards.page(params[:page]).per(15)
        @categories = Category.all
        render "index"
      end
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
        @categories = Category.all
        @comments = @board.comments.page(params[:page])
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
