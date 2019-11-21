class CategoriesController < ApplicationController
    
    def index
    	@categories = Category.all
    end
  
	def show
		@category = Category.find(params[:id])
		@q = Board.ransack(params[:q])
		@boards = @q.result(distinct: true)
	end

	def search
		@q = Board.ransack(search_params)
		@boards = @q.result(distinct: true)
	end
end

