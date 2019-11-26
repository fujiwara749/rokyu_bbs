class BoardsController < ApplicationController
    before_action :login_check, only: [:new]

	def index
        @q = Board.ransack(params[:q])
        if params[:q].present?
            @boards = @q.result(distinct: true).page(params[:page]).per(15)
        else
            @boards = Board.all.order(created_at: :desc)
    		@boards = @boards.page(params[:page]).per(15)
        end

		@board = Board.new
        @categories = Category.all

	end

    def search
        @q = Board.ransack(search_params)
        @boards = @q.result(distinct: true)
        @boards = @boards.page(params[:page])
    end

	def new
		@board = Board.new
		@category = Category.new
        @categories = Category.all
	end

    def show
    	@board = Board.find(params[:id])
        @categories = Category.all
    	@comments = @board.comments
        @comment = Comment.new
        @comments = @board.comments.page(params[:page])
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

    def login_check
        unless user_signed_in?
            flash[:alert] = "スレッド新規作成はログインが必要です。"
            redirect_to root_path
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