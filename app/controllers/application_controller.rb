class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' and return unless current_user
  end

  # def require_admin
  #  redirect_to root_url unless current_user =! nil && current_user.admin?
  # end

  def require_admin
    if current_user.nil?
      redirect_to root_url and return
    elsif !current_user.admin?
      redirect_to root_url and return
    end
  end

  # GET /items/new
  def index
    @categories = Category.all
  end
end
