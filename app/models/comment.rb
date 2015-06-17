class Comment < ActiveRecord::Base
	validates :post_id, :body, presence: true
	scope :user_id, -> { where(user_id: 1)}

	belongs_to :post
end
