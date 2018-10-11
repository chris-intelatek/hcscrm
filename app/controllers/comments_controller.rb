class CommentsController < ApplicationController
	before_action :find_prospect, only: [:create, :edit, :update, :destroy]
	before_action :find_comment, only: [:edit, :update, :destroy]
  
	def create
		# creates a comment with respect to the prospect
		@comment = @prospect.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			redirect_to prospect_path(@prospect)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to prospect_path(@prospect)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to prospect_path(@prospect)
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end

		def find_prospect
			@prospect = Prospect.find(params[:prospect_id])
		end

		def find_comment
			@comment = @prospect.comments.find(params[:id])
		end

end