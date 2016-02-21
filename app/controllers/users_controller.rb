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

  def edit
    redirect_to root_url unless !current_user.nil? && @user.id == current_user.id
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
    if !current_user.nil? && @user.id == current_user.id
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
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
    params.require(:user).permit(:name, :telephone, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
