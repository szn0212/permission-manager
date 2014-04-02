module PermissionsHelper
    def subject_name(subject)
        if subject == 'tasks'
            return '任务'
        elsif subject == 'users'
            return '用户'
        elsif subject == 'permissions'
            return '权限'
        elsif subject == 'roles'
            return '角色'
        else
            return subject
        end
    end
end
