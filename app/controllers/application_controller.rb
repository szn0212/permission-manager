class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_login
  enable_authorization do |exception|
    render status: 403, text: '您没有权限访问这个页面'
  end unless :login_controller?

  private
  def current_user
    session[:account]
  end

  def check_login
    redirect_to(controller: :login, action: :index) if current_user.nil?
  end
end
