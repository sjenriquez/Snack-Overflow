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
      redirect_to nom_tags_path
    else
      #change this so that it refers to tags errors
      @errors = @comment.errors.messages
      redirect_to :back
    end
  end

  private
    def set_user
      params[:tag][:user_id] = session[:user_id]
    end

    def tag_params
      set_user
      params.require(:tag).permit(:id, :name, :tagable_id, :tagable_type, :user_id)
    end

end