class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: session_params[:username])

    if @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to "/" #Needs to change to root route as soon as it is made.
    else
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end


end
