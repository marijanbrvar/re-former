class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User data is updated!' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_path, notice: 'User data is updated!' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
