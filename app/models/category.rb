class Category < ApplicationRecord
	has_many :boards, dependent: :destroy
end
