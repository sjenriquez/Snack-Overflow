class TagsController < ApplicationController

  def index
    if params[:nom_id]
      @tags = Tag.all.where(tagable_id: params[:nom_id])
    elsif params[:user_id]
      @tags = Tag.all.where(tagable_id: params[:user_id])
    else
      #fix this and make a tags specific error
      @errors = @comment.errors.messages
    end
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path
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
