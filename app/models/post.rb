class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :post_type
  has_many :comments, dependent: :destroy
end
