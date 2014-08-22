class CommentsController < ApplicationController

  def new
    @tipp = Tipp.find_by(name: params[:tipp_id])
    @comment = Comment.new
 end

  def create

    @comment = Comment.new(comment_params)
    @tipp = Tipp.find(@comment.tipp_id)
    @user = User.find(@comment.user_id)

    if @comment.save 
      @tipp.update_points("commented", @user.role)
      @user.update_karma("commented")

      redirect_to new_tipp_path, :flash => { :notice => "Thanks for your Comment!"}
    else
      redirect_to new_tipp_path, :flash => { :comment_error => "sorry, something went wrong"}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :tipp_id)
  end
end