class Board < ApplicationRecord 
	has_many :comments
	belongs_to :user
	belongs_to :category  
end
