class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.first_or_initialize(name: tag_params[:name])

    if @tag.save
      NomTag.create(tag_id: @tag.id, nom_id: tag_params[:nom_id])
      redirect_to :back
    else
      @errors = @comment.errors.messages
      redirect_to :back
    end
  end

  private
    def set_user
      params[:tag][:user_id] = session[:user_id]
    end

    def set_name
      if params[:tag][:select_name]
        params[:tag][:name] = params[:tag][:add_name]
      else
        params[:tag][:name] = params[:tag][:select_name]
      end
    end

    def tag_params
      set_user
      set_name
      params.require(:tag).permit(:id, :name, :user_id, :nom_id)
    end

end
