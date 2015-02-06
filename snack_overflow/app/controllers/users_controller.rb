class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      p "success"
      redirect_to user_show_path(@user)
    else
      redirect_to :back
    end
  end

  def show
  end

  def edit
    if @user.id == session[:user_id]
      render :edit
    else
      redirect_to :root
    end
  end



  private

  def load_user
     @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :bio, :website_url, :pic_url, :password)
  end

end
