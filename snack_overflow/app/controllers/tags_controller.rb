class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to :back
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
      params.require(:tag).permit(:id, :name, :user_id)
    end

end
