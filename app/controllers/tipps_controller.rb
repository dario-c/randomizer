class TippsController < ApplicationController
skip_before_filter :authenticate_user!, :only => [:index]

  def index    
    # cookies.delete :choices
    unless cookies[:choices]
      todays_choices =  Tipp.random_five(user_signed_in?)
      cookies[:choices] = { value: JSON.generate(todays_choices), expires: 24.hours.from_now }
    end
    cookie = JSON.parse(cookies[:choices])  
    @random_choices = Tipp.find_these(cookie) 
  end

  def new
    @tipp = Tipp.new
  end

  def create
    @keep_name = params[:name]
    @tipp = Tipp.new(tipp_params)
            
    if @tipp.save

      @user = User.find(@tipp.user_id)
      @user.update_karma("created")
      @tipp.update_points("created", @user.role)
      
      redirect_to new_tipp_path, :flash => {:addcomment => "", :tipp => @tipp.name} 
    
    else 
      @errors = @tipp.errors.full_messages
      @error = @tipp.errors[:name]

      if @error[0] && @error[0].include?("been taken")
        redirect_to new_tipp_path, :flash => {:taken => "", :tipp => @tipp.name} 

      else
      redirect_to new_tipp_path, :flash => { :error => "Sorry, your data doesnt seem to be correct."}
      end
    end
  end

  private
    def tipp_params 
      params.require(:tipp).permit(:name, :website, :twitter, :streetname,:image, :remote_image_url, :user_id, :city_id)
    end
end

