class TagsController < ApplicationController

  def create
    @tag = Tagn.new(tag_parmas)

    if @tag.save
      redirect_to :index
    else
      #change this so that it refers to tags errors
      @errors = @comment.errors.messages
      redirect_to :back
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:id, :name, :tagable_id, :tagable_type)
    end

end
