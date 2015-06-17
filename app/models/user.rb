class User < ActiveRecord::Base
	validates :email, presence: true

	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
end
