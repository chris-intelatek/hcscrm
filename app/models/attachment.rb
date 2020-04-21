class Attachment < ActiveRecord::Base
  belongs_to :prospect
  belongs_to :user
  validates :description, :presence => true
  validates :document, :presence => true  
  mount_uploader :document, AttachmentUploader
end