class AttachmentsController < ApplicationController

	def create
		@prospect_attachment = @prospect.attachments.create(attachment_params)
		@user_attachment = @user.attachments.create(attachment_params)
		if @attachment.save
		  flash[:success] = "Your file bas been attached"
			redirect_to :back
		else
			redirect_to :back
		end
	end

	def edit
	end

	def update
		if @attachment.update(attachment_params)
			redirect_to :back
		else
			render 'edit'
		end
	end

	def destroy
		@attachment.destroy
		redirect_to :back
	end

	private

		def attachment_params
			params.require(:attachment).permit(:description, :document)
		end

end
