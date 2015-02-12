class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    redirect_to :back
  end

  def show
  end

  private
    def vote_params
      params.require(:vote).permit(:decision, :votable_id, :votable_type)
    end

end
