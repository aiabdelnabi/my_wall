class Comment < ActiveRecord::Base
	belongs_to :status

	validates :body, presence: true

	#scope :top_comments -> {top(3)}

end
