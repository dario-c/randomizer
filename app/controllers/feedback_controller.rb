class FeedbackController < ApplicationController


  def index
    if params[:search]
      @tipps = Tipp.find_by(name: params[:search])

      if @tipps
        @total = @tipps.get_likes.size - @tipps.get_dislikes.size 
      else
        flash.now[:notice] = "Sorry, we dont seem to have that one"    
      end
    end
  end

  def vote

    vote = params[:vote]
    tipp = params[:tipp]
    voted = Tipp.find(tipp)


    if vote == "up"
      voted.liked_by current_user
      voted.update_points("voted","up") if voted.vote_registered?
    elsif vote == "down"
      voted.disliked_by current_user
      voted.update_points("voted", "down") if voted.vote_registered?
      flash[:voted]="Achtung!"  if  voted.points <= 0

    end


    flash[:voted] = "Thanks for voting!" if voted.vote_registered?
    redirect_to action: 'index', search: voted.name

  end


end

