class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create]

	def index
		@status = Status.find(params[:status_id])
		@new_comment = Comment.new
	end

	def create
		@status = Status.find(params[:status_id])
	    @new_comment = @status.comments.new(comment_params)
	    if @new_comment.save
	    	redirect_to status_comments_path(@status)
	    else
			render action: :index
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
