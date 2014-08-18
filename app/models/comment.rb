class Comment < ActiveRecord::Base

  validates :content, length: { maximum: 140 } 

  validates :tipp_id, presence: true
  validates :user_id, presence: true
end