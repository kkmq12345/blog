class PostType < ActiveRecord::Base
	validates :category, presence: true

	has_many :post
end
