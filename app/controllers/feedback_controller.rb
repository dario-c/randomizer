class FeedbackController < ApplicationController


def index
  if params[:search]
    @tipps = Tipp.find_by(name: params[:search])
  end
end



end

