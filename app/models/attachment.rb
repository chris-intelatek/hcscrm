class Attachment < ActiveRecord::Base
  belongs_to :prospect
  belongs_to :user
  mount_uploader :document, AttachmentUploader
end