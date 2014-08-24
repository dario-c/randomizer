class CommentsController < ApplicationController

  def new
    @tipp = Tipp.find_by(name: params[:tipp_id])
    @comment = Comment.new
  end

  def create

    @comment = Comment.new(comment_params)
    @tipp = Tipp.find(@comment.tipp_id)
    user = User.find(@comment.user_id)

    tipp_owner = User.find(@tipp.user_id)

    if @comment.save
      @tipp.update_points("commented", user.role)
      user.update_karma("commented")
      tipp_owner.update_karma("vouched_for")

      redirect_to new_tipp_path, :flash => { :notice => "Thanks for your Comment!"}
    else
      flash.now[:error] = "Please make sure that your comment is in between 4 and 140 characters"
      render  new_comment_path, :tipp => @tipp.name 
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :tipp_id)
  end
end


