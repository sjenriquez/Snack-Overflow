class NomsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @noms = Noms.all
  end

  def show
  end

  def new
    @nom = Nom.new
  end

  def edit
  end

  def create
    @nom = Nom.new(nom_params)

    if @nom.save
      redirect_to new_nom_path
    else
      @errors = @nom.errors.messages
      redirect_to :back
    end
  end

  def update
    if @nom.update(nom_params)
       redirect_to nom_path
    else
      @errors = @nom.errors.messages
      redirect_to :back
    end
  end

  def destroy
    @nom.destroy
    redirect_to root_path
  end


  private

  def set_nom
    @nom = Nom.find(params[:id])
  end

  def nom_params
    params.require(:nom).permit(:title, :review, :user_id)
  end
end
