class Comment < ActiveRecord::Base
  belongs_to :prospect
  belongs_to :user
end
