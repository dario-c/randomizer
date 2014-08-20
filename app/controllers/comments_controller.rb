class TippsController < ApplicationController

def new
  @comment = Comment.new
end

def create
  @comment.create(comment_params)


end

private

def comment_params

  params.require(:comment).permit(:content, :user_id, :tipp_id)

end


end