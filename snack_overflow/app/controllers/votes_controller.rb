class VotesController < ApplicationController


  def create
    @vote =Vote.new(vote_params)

    if @vote.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def show
  end



  private
    def vote_params
      params.require(:vote).permit(:decision, :votable_id, :votable_type)
    end

end
