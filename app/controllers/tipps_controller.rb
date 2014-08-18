class TippsController < ApplicationController
skip_before_filter :authenticate_user!, :only => [:index]

  def index
    @random_choices = Tipp.random_ten
  end

  def new
    @tipp = Tipp.new
  end

  def create
    @tipp = Tipp.new(tipp_params)

    if @tipp.save
      redirect_to tipps_path

    else 
      @error = @tipp.errors.full_messages

      redirect_to new_tipp_path, :flash => { :error => "Sorry, your data doesnt seem to be correct.Please check again that you added all the required fields"}
    end


  end

  private
    def tipp_params 
      params.require(:tipp).permit(:name, :website, :twitter, :streetname, :user_id, :city_id)
    end
end

