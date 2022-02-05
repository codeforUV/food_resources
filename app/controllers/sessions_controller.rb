class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])

    if @user
      login @user
      redirect_to root_path, notice: "Signed in."
    else
      @user = User.new(email: params[:user][:email])
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Signed out."
  end
end
