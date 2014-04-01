# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    checkboxes = $("input[name=assign_role]")
    checkboxes.each ->
        $(this).attr('old-checked',$(this).attr('checked'))
    role_id = $("#btnAssignPermission").attr('role_id')
    $("#btnAssignPermission").click ->
        new_permissions = []
        deleted_permissions = []
        checkboxes.each ->
            permission_id = $(this).attr('permission_id')
            old = $(this).attr('old-checked')
            now = if this.checked then 'checked' else undefined
            return if old == now
            deleted_permissions.push(permission_id) if old == 'checked'
            new_permissions.push(permission_id) if now == 'checked'
        news = ''
        deleteds = ''
        for p in new_permissions
            news += p + ','
        for p in deleted_permissions
            deleteds += p + ','
        $.post '/roles/assign_permissions', {
            'news': news, 'deleteds': deleteds, 'role_id': role_id
        }, (data) ->
            showMessage(data.message)
            location.reload if !data.success
        , 'json'
