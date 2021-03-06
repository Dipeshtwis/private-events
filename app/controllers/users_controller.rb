class UsersController < ApplicationController
  def new
    @user = User.new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    @user = User.create(signup_params)
    if @user.save
      flash[:success] = 'Account is sucessfully created'
      session[:user_id] = @user.id
      session[:username] = @user.name
      redirect_to user_path(@user)
    else
      flash[:danger] = 'You are an existing user...  Please sign in'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_events = current_user.events
    @up_events = @user.attended_events.upcoming
    @prev_events = @user.attended_events.past
  end

  def destroy
    session[:user_id] = nil
    session[:username] = nil
    flash[:success] = 'You have successfully logged out'
    redirect_to root_path
  end

  private

  def signup_params
    params.require(:user).permit(:name)
  end
end
