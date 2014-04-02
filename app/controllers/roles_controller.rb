class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all
  end

  # GET /roles/1
  def show
    @permissions = Permission.all
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to @role, notice: 'Role was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /roles/1
  def update
    if @role.update(role_params)
      redirect_to @role, notice: 'Role was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    redirect_to roles_url
  end

  def assign_permissions
    role_id = params[:role_id]
    news = params[:news].split(',')
    news.each do |n|
      RolePermission.create(role_id: role_id, permission_id: n)
    end
    deleteds = params[:deleteds].split(',')
    deleteds.each do |d|
      RolePermission.destroy_all ['role_id = ? and permission_id = ?', role_id, d]
    end
    render json: {success: true, message: '操作成功'}
  rescue Exception => e
    render json: {success: false, message: '操作失败'}
  end

  def permissions
    ids = params[:ids].split(",")
    roles = Role.find(ids)
    permissions = []
    roles.each do |role|
      permissions.concat role.permissions
    end
    render json: permissions
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name)
  end
end
