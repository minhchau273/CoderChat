class UsersController < ApplicationController
  def index
    @all_users = User.where("id != #{current_user.id}")
  end

  def new
    @user = User.new
    render layout: false
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/", success: SIGN_UP_SUCCESSFULLY_MESSAGE
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
      render 'new', layout: false
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
