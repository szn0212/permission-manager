module PermissionsHelper
    def subject_name(subject)
        if subject == 'Task'
            return '任务'
        elsif subject == 'User'
            return '用户'
        elsif subject == 'Permission'
            return '权限'
        elsif subject == 'Role'
            return '角色'
        end
    end
end
