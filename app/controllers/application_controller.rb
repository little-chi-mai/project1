class ApplicationController < ActionController::Base
  before_action :fetch_user # check 

  private
  def fetch_user
    @current_user = User.find session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present?
  end

  def check_for_login
    redirect_to login_path unless @current_user.present?
  end

  def check_for_admin
    redirect_to root_path unless @current_user.present? && @current_user.admin?
  end

end
