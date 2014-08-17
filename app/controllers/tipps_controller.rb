class TippsController < ApplicationController


  def index
    @random_choices = Tipp.random_ten
  end


end
