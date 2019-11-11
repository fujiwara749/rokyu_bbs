class BoardsController < ApplicationController

	def index
		@boards = Board.all
	end	

    def new
    end

    def create
    end

    def show
    end
end