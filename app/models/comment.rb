class Comment < ApplicationRecord
	
	validates :comment, presence: true

	belongs_to :user, -> { with_deleted }
	belongs_to :board
end
