module UsersHelper
    def sex_format(sex)
        sex == 1 ? '男' : '女'
    end

    def user_has_role(role)
        @user.account.roles.each do |r|
            return true if r.id == role.id
        end
        false
    end

    def user_has_permission(permission)
        @user.account.roles.each do |r|
            r.permissions.each { |p| return true if p.id == permission.id}
        end
        false
    end
end
