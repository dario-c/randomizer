class TippsController < ApplicationController
skip_before_filter :authenticate_user!, :only => [:index]

  def index
    cookies.delete :choices    
    
    if cookies[:choices]

    cookie = JSON.parse(cookies[:choices])  
    @random_choices = Tipp.find_these(cookie)
    
    else
      user_signed_in? ? option = Tipp.random_five_logged : option = Tipp.random_five_unlogged 

      @random_choices =  option
      cookies[:choices] = {value: JSON.generate(option),               
                        expires: 2.hours.from_now}
      cookie = JSON.parse(cookies[:choices])  
      @random_choices = Tipp.find_these(cookie)
    end

  end

  def new
    @tipp = Tipp.new
    @tipp.comments.build
    # cookies.delete :choices
  end

  def create
    @keep_name = params[:name]
    @tipp = Tipp.new(tipp_params)
            
    if @tipp.save

      @user = User.find(@tipp.user_id)
      @user.update_karma("created")
      @tipp.update_points("created", @user.role)
      
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
      params.require(:tipp).permit(:name, :website, :twitter, :streetname,:image, :remote_image_url, :user_id, :city_id, comments_attributes: [:content])
    end
end

