class Admin::CategoriesController < ApplicationController

  before_action :login_check, only: [:new, :destroy]

  def index
  @categories = Category.page(params[:page]).per(9)
  end

  def new
    @categories =Category.all  	
   	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
      redirect_to admin_categories_path
    else
      @categories =Category.all
      render :new
    end
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  def login_check
    unless admin_signed_in?
    flash[:alert] = "権限がありません。ログインが必要です。"
    redirect_to admin_top_path
    end
  end
  
  private
  def category_params
  	 params.require(:category).permit(:category_name) 
  end
end
