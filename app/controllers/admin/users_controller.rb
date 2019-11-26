class Admin::UsersController < ApplicationController

    before_action :login_check, only: [:destroy]    

	def index
	    @users = User.with_deleted.page(params[:page]).per(10)
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
    	@user = User.find(params[:id])
    	@user.destroy
    	redirect_to admin_users_path
    end

    def login_check
        unless admin_signed_in?
            flash[:alert] = "ユーザー削除にはログインが必要です。"
            redirect_to admin_top_path
        end
    end
end
