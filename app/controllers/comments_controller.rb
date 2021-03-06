class CommentsController < ApplicationController
	before_action :login_check, only: [:create]

	def create
		board = Board.find(params[:board_id])
		comment = Comment.new(comment_params)
		comment.board_id = board.id
		comment.user_id = current_user.id
		comment.save
		redirect_to board_path(board)
	end

	def login_check
		unless user_signed_in?
			flash[:alert] = "コメントするにはログインが必要です。"
			redirect_to root_path
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :board_id, :comment)
	end
end