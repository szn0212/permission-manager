class LoginController < ApplicationController
  skip_before_filter :check_login

  def index
    @account = Account.new
    render :index, layout: false
  end

  def login
    password = Digest::MD5.hexdigest params[:password]
    search = Account.find_by_username params[:username]
    if search && password == search.password
      flash[:info] = '登录成功'
      session[:account] = search
      redirect_to controller: 'tasks', action: 'index'
    else
      flash[:error] = '用户名不存在或密码不匹配！'
      redirect_to action: 'index'
    end
  end

  def logout
    reset_session
    redirect_to action: 'index'
  end
end
