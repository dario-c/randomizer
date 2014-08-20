class TippsController < ApplicationController
skip_before_filter :authenticate_user!, :only => [:index]

  def index
    @random_choices = Tipp.random_ten
  end

  def new
    @tipp = Tipp.new
    @tipp.comments.build
  end

  def create
    @keep_name = params[:name]
    @tipp = Tipp.new(tipp_params)
            
    if @tipp.save
      case User.find(@tipp.user_id).role
        when "regular"
          @tipp.update(points:10)
        when "ambassador"
          @tipp.update(points:100)        
        else
        
      end

      @tipp.save!
      redirect_to tipps_path, :flash => { :notice => "Thanks for your Tipp!"}

    else 
      @errors = @tipp.errors.full_messages
      @error = @tipp.errors[:name]

      if @error[0] && @error[0].include?("been taken")
        redirect_to new_tipp_path, :flash => {:taken => "",:tipp => @tipp.name} 

      else
      redirect_to new_tipp_path, :flash => { :error => "Sorry, your data doesnt seem to be correct. #{@tipp.name}"}
      end
    end
  end

  private
    def tipp_params 
      params.require(:tipp).permit(:name, :website, :twitter, :streetname, :user_id, :city_id, comments_attributes: [:content])
    end
end

