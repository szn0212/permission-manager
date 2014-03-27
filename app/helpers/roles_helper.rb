module RolesHelper
    def role_has_permission(permission)
        @role.permissions.each do |p|
            return "checked" if permission.id == p.id
        end
        ""
    end
end
