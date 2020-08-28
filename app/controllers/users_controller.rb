class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.create(signup_params)
  	if @user.save
  	  flash[:notice] = 'Account is sucessfully created'
  	  session[:user_id] = @user.id
      session[:username] = @user.name
  	  redirect_to user_path(@user)
  	else
  	  flash[:alert] = 'Oops!! Something went wrong...'
  	  render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  private

  def signup_params
  	params.require(:user).permit(:name)
  end
end
