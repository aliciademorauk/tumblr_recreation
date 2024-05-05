class SessionsController < ApplicationController
  before_action :authenticated, only: [:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(user_params[:email].downcase)
    if @user&.authenticate(user_params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Successfully signed in!"
      redirect_to root_path
    else
      flash.now[:error] = "There was a problem signing you in..."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:alert] = "Successfully signed out!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
