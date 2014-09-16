class Comment < ActiveRecord::Base
  belongs_to :tipp 
  belongs_to :user

  validates :content, length: { in: 4..140, wrong_length: "Please type a comment in between 4 and 140 words" } 
  validates :user_id, :tipp_id, presence:true

  private

  def self.random_comment(tipp)
    Comment.where(tipp: tipp).sample
  end
end