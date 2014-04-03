class PermissionsController < ApplicationController
  authorize_resource :permission
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  # GET /permissions
  def index
    @permissions = Permission.all
  end

  # GET /permissions/1
  def show
  end

  # GET /permissions/new
  def new
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
  end

  # POST /permissions
  def create
    @permission = Permission.new(permission_params)

    if @permission.save
      redirect_to @permission, notice: '权限已成功创建。'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /permissions/1
  def update
    if @permission.update(permission_params)
      redirect_to @permission, notice: '权限已成功更新。'
    else
      render action: 'edit'
    end
  end

  # DELETE /permissions/1
  def destroy
    @permission.destroy
    redirect_to permissions_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_permission
    @permission = Permission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permission_params
    params.require(:permission).permit(:action, :subject, :description)
  end
end
