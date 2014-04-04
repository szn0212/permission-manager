# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    checkboxes = $("input[name=assign_role]")
    checkboxes.each ->
        $(this).attr('old-checked',$(this).prop('checked'))
    role_id = $("#btnAssignPermission").attr('role_id')
    $("#btnAssignPermission").click ->
        news = ""
        deleteds = ""
        checkboxes.each ->
            permission_id = $(this).attr('permission_id')
            old = $(this).attr('old-checked')
            now = $(this).prop('checked')
            return if old == now.toString()
            news += permission_id + ',' if now
            deleteds += permission_id + ',' if !now
        $.post '/roles/assign_permissions', {
            'news': news, 'deleteds': deleteds, 'role_id': role_id
        }, (data) ->
            showMessage(data.message)
            if data.success
                checkboxes.each ->
                    $(this).attr('old-checked',$(this).prop('checked'))
            else
                location.reload
        , 'json'
