class TippsController < ApplicationController


  def index
    @random_choices = random_ten
  end




  private

  def random_ten

    @random_count =  []
    @count =         Tipp.count

    while(@random_count.uniq.size < 10)
    @random_count << rand(@count)
    end

  @random_count.uniq
  end




end
