class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	@user = User.create(signup_params)
  	if @user.save
  	  flash[:notice] = 'Account is sucessfully created'
  	  redirect_to_user_path
  	else
  	  flash[:alert] = 'Oops!! Something went wrong...'
  	  render 'new'
  	end
  end

  def show
  end

  private

  def signup_params
  	params.require(:user).permit(:name)
  end
end
