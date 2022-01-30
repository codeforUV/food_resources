class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :update]
  before_action :redirect_if_authenticated, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(create_user_params)
    if @user.save
      redirect_to root_path, notice: "User created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.authenticate(params[:user][:current_password])
      if @user.update(update_user_params)
        redirect_to root_path, notice: "Account updated."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:error] = "Incorrect password"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    reset_session
    redirect_to root_path, notice: "Your account has been deleted."
  end

  private

  def create_user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:email, :current_password, :password, :password_confirmation)
  end
end