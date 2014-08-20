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
    @tipp = Tipp.new(tipp_params)

    if @tipp.save
     
    redirect_to tipps_path, :flash => { :notice => "Thanks for your Tipp!"}
    else 
      @errors = @tipp.errors.full_messages
      @error = @tipp.errors[:name]


      if @error[0].include?("been taken")
      redirect_to new_tipp_path, :flash => {:taken => ""} 

      else
      redirect_to new_tipp_path, :flash => { :error => "Sorry, your data doesnt seem to be correct. #{@errors}"}
      end
    end


  end

  private
    def tipp_params 
      params.require(:tipp).permit(:name, :website, :twitter, :streetname, :user_id, :city_id, comments_attributes: [:content])
    end
end

