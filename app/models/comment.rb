class Comment < ActiveRecord::Base
  belongs_to :tipp 
  belongs_to :user

  validates :content, length: { maximum: 140 } 

  after_create :delete_empty_comments, :delete_not_related_comments

  private

  def delete_empty_comments    
    unless self.content
      self.destroy
    end
  end

  def delete_not_related_comments

    # comment = Comment.last
    # if comment.user_id && comment.tipp_id
    #   if comment.user_id.empty? || comment.tipp_id.empty?
    #     comment.destroy
    #   end
    # end
  end
end

  
 # comment = Comment.where(tipp_id:@tipp.id)[0]
 #     if comment.content.empty?
 #      comment.destroy
 #     end
