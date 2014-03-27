module ApplicationHelper
    def active_class(controller)
        params[:controller] == controller ? 'active' : ''
    end
end
