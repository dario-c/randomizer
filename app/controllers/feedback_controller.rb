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
    owner = User.find(voted.user_id)

    if vote == "up"
      voted.liked_by current_user

      if voted.vote_registered?
        voted.update_points("voted","upvoted") 
        owner.update_karma("upvoted")
      end

    elsif vote == "down"  
      voted.disliked_by current_user
    
      if voted.vote_registered?
        voted.update_points("voted", "downvoted")
        owner.update_karma("downvoted")
      end 
      
      flash[:voted]="Achtung!"  if  voted.points <= 0

    end


    flash[:voted] = "Thanks for voting!" if voted.vote_registered?
    redirect_to action: 'index', search: voted.name

  end


end

