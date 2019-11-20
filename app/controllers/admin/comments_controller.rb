class Admin::CommentsController < ApplicationController
	
	before_action :login_check, only: [:destroy]

    def index
    	@comment = Comment.all
    end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to admin_boards_path
	end

	def login_check
		unless admin_signed_in?
			flash[:alert] = "コメント削除にはログインが必要です。"
			redirect_to admin_top_path
		end
	end
end
