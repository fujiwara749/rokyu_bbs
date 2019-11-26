class Board < ApplicationRecord 
	
	validates :thread_title, presence: true

	has_many :comments
	belongs_to :user
	belongs_to :category  
end
