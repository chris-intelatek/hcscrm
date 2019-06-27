class Comment < ActiveRecord::Base
  belongs_to :prospect
  belongs_to :user
  
  def content_field
    content_fields = ['vcp_content', 'hcs_content', 'pay_content']
    content_fields.select{ |field| attributes[field].present? }.first
  end
end
