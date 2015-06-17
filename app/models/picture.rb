class Picture < ActiveRecord::Base
	validates :link, presence: true
end
