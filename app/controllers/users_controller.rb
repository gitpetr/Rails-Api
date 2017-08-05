class UsersController < ApplicationController
  before_action :load_model, only: [:show, :update, :destroy]

  def index
    render json: @users.order(:username), status: :ok
  end

  def create
    @user = user.create!(user_params)
    render json: @user, status: :created
  end

  def show
    render json: @user, status: :ok
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.require(:user).permit(:username, :email, :password)
  end

  def load_model
    @user = User.find params[:id]
  end
end
