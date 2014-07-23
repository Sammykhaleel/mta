class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Yay! :)'
      redirect_to root_url
    else
      flash.now[:error] = 'Something went wrong :('
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone_number :password, :password_confirmation)
    end
end
