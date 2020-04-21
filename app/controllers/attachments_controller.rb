class AttachmentsController < ApplicationController
	before_action :find_prospect, only: [:create, :edit, :update, :destroy]
	before_action :find_attachment, only: [:edit, :update, :destroy]
	
	def create
		@prospect_attachment = @prospect.attachments.create(attachment_params)
		@prospect_attachment.user_id = current_user.id
		# @user_attachment = @user.attachments.create(attachment_params)
		if @prospect_attachment.save
		  flash[:success] = "Your file bas been attached"
			redirect_to prospect_path(@prospect)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @prospect_attachment.update(attachment_params)
			redirect_to prospect_path(@prospect)
		else
			render 'edit'
		end
	end

	def destroy
		@prospect_attachment.destroy
		redirect_to prospect_path(@prospect)
	end

	private
		def attachment_params
			params.require(:attachment).permit(:description, :document, :user_id, :service_type)
		end

		def find_prospect
			@prospect = Prospect.find(params[:prospect_id])
		end

		def find_attachment
			@prospect_attachment = @prospect.attachments.find(params[:id])
		end
end