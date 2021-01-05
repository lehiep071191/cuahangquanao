class CommentsController < ApplicationController
	def create
		@comment = Comment.new( content: params[:content], user_id: params[:user_id], product_id: params[:product_id])
		if @comment.save!
			render json: {
				data_comment: render_to_string(@comment)
			}
		end
	end		
end
