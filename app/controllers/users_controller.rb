class UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :edit, :update, :show]

  before_action :require_admin, only: [:index, :destroy]

  def new
  	@user = User.new
  end

  def show
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :telephone, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
