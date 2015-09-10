class Status < ActiveRecord::Base
	has_many :comments

	validates :title,   presence: true, length: { minimum: 2 }
	validates :content, presence: true, length: { minimum: 5 }

	def top_comments
		comments.limit(3)
	end
end