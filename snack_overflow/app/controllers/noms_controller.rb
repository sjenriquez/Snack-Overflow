class NomsController < ApplicationController
  before_action :set_nom, only: [:show, :edit, :update, :destroy]

  def index
    @noms = Nom.all
  end

  def show
    @nom = Nom.find(params[:id])
    @tags = Tag.tags_for_select
  end

  def new
    @nom = Nom.new
  end

  def edit
    @nom = Nom.find(params[:id])
  end

  def create

    @nom = Nom.new(nom_params)

    if @nom.save
      redirect_to nom_path(@nom.id)
    else
      @errors = @nom.errors.messages
      redirect_to :back
    end
  end

  def update
    if @nom.update(nom_params)
       redirect_to nom_path(@nom.id)
    else
      @errors = @nom.errors.messages
      redirect_to :back
    end
  end

  def destroy
    @nom = Nom.find(params[:id])
    @nom.destroy
    redirect_to root_path
  end

  def upvote
    @nom = Nom.find(params[:id])
    @nom.upvote(session[:user_id])
    redirect_to nom_path(@nom.id)
  end

  def downvote
    @nom = Nom.find(params[:id])
    @nom.downvote(session[:user_id])
    redirect_to nom_path(@nom.id)
  end


  private

  def set_user
    params[:nom][:user_id] = session[:user_id]
  end

  def set_nom
    @nom = Nom.find(params[:id])
  end

  def nom_params
    set_user
    params.require(:nom).permit(:title, :review, :user_id, :pic_url)
  end
end
