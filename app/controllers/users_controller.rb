class UsersController < ApplicationController
  authorize_resource :user
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @roles = Role.all
    @permissions = Permission.all.order('subject desc')
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url
  end

  def assign_roles
    user = User.find params[:user_id]
    news = params[:news].split(",")
    deleteds = params[:deleteds].split(",")
    news.each do |n|
      AccountRole.create! account_id: user.account.id, role_id: n
    end
    deleteds.each do |n|
      AccountRole.delete_all ['account_id = ? and role_id = ?', user.account.id, n]
    end
    render json: { success: true, message: '操作成功' }
  rescue
    render json: { success: false, message: '操作失败' }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:account_id, :nickname, :sex)
  end
end
